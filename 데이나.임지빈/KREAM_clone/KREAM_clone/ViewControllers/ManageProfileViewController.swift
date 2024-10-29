import UIKit

class ManageProfileViewController: UIViewController, UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = manageprofileview
        editNavigationBar()
        loadUserInfo()

        manageprofileview.userEmailEditButton.addTarget(self, action: #selector(userEmailEditButtonTap), for: .touchUpInside)
        manageprofileview.userPasswordEditButton.addTarget(self, action: #selector(userPasswordEditButtonTap), for: .touchUpInside)
        //profileimage 눌렀을때 pickprofileimage 함수 호출시키기
        manageprofileview.profileImage.addTarget(self, action: #selector(pickProfileImage),for: .touchUpInside)
        
        

    }
    
    private var manageprofileview: ManageProfileView = {
        let view = ManageProfileView()
        return view
    }()
  
    //
    @objc
    func pickProfileImage(_ sender:Any) {
        //imagepickercontroller 생성
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary //이미지 소스로 라이브러리
        picker.allowsEditing = true //이미지 편집 기능
        picker.delegate = self
        
        self.present(picker,animated:false) //image picker 컨트롤러 실행
    }
    
    
    
    
    private let userInfoModel = UserInfoModel()
    
    //네비게이션바
    func editNavigationBar(){
        let customBackButtonImage = UIImage(systemName: "arrow.left")?.withTintColor(.black, renderingMode: .alwaysOriginal) //renderingMode 안하면 적용안되고 반환돼서 안써주면 그냥 파랑색으로 나옴
        let customBackButton = UIBarButtonItem(image: customBackButtonImage, style: .plain, target: self, action: #selector(backButtonTap))
        
        self.navigationItem.title = "프로필 관리"
        self.navigationItem.hidesBackButton = true //backbutton 숨기기
        self.navigationItem.leftBarButtonItem = customBackButton
    }
    
    @objc func backButtonTap() {
        navigationController?.popViewController(animated: true)
    }
    
    //저장된 텍스트 있을 경우 가져오기
    private func loadUserInfo() {
        if let savedEmail = userInfoModel.loadEmail() {
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor(hex: "#A2A2A2") ?? UIColor.gray
            ]
            let emailPlaceholder = NSAttributedString(string: savedEmail, attributes: attributes)
            manageprofileview.userEmailTextField.attributedPlaceholder = emailPlaceholder //그 텍스트필드에 저장된 이메일 넣어주기
        }
        
        if let savedPassword = userInfoModel.loadPassword() {
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor(hex: "#A2A2A2") ?? UIColor.gray
            ]
            let passwordPlaceholder = NSAttributedString(string: savedPassword, attributes: attributes)
            manageprofileview.userPasswordTextField.attributedPlaceholder = passwordPlaceholder
        }
    }
    
    //변경 버튼 눌렸을때 이메일 텍스트필드 없어지고 완료 버튼 누르기
    @objc
    private func userEmailEditButtonTap() {
        if manageprofileview.userEmailEditButton.currentTitle == "변경" {
            manageprofileview.userEmailTextField.placeholder = "새로운 이메일을 입력해주세요!"
            manageprofileview.userEmailTextField.text = nil
            manageprofileview.userEmailTextField.isUserInteractionEnabled = true
            manageprofileview.userEmailEditButton.setTitle("확인", for: .normal)
        }
        else if manageprofileview.userEmailEditButton.currentTitle == "확인" {
            manageprofileview.userEmailTextField.isUserInteractionEnabled = false
            guard let text = manageprofileview.userEmailTextField.text, !text.isEmpty else { return }
            userInfoModel.saveEmail(text)
            manageprofileview.userEmailEditButton.setTitle("변경", for: .normal)
        }
    }
    
    //변경 버튼 눌렸을때 패스워드 텍스트필드 없어지고 완료 버튼 누르기
    @objc
    private func userPasswordEditButtonTap() {
        if manageprofileview.userPasswordEditButton.currentTitle == "변경" {
            manageprofileview.userPasswordTextField.placeholder = "새로운 비밀번호를 입력해주세요!"
            manageprofileview.userEmailTextField.text = nil
            manageprofileview.userPasswordTextField.isUserInteractionEnabled = true
            manageprofileview.userPasswordEditButton.setTitle("확인", for: .normal)
        }
        else if manageprofileview.userPasswordEditButton.currentTitle == "확인" {
            manageprofileview.userPasswordTextField.isUserInteractionEnabled = false
            guard let text = manageprofileview.userPasswordTextField.text, !text.isEmpty else { return }
            userInfoModel.savePassword(text)
            manageprofileview.userPasswordEditButton.setTitle("변경", for: .normal)
        }
    }
}

extension ManageProfileViewController: UIImagePickerControllerDelegate {
    //이미지 피커에서 이미지를 선택하지 않고 취소했을 때 호출되는 메소드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    //이미지 피커에서 이미지 선택했을때 호출되는 메서드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let editedImage = info[.editedImage] as? UIImage {
                manageprofileview.profileImage.image = editedImage
            } else if let originalImage = info[.originalImage] as? UIImage {
                manageprofileview.profileImage.image = originalImage
            }
            picker.dismiss(animated: true)
        }
}
