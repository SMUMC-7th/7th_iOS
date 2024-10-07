import UIKit

class ManageProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = manageprofileview
        editNavigationBar()
        loadUserInfo()

        manageprofileview.userEmailEditButton.addTarget(self, action: #selector(userEmailEditButtonTap), for: .touchUpInside)
        manageprofileview.userPasswordEditButton.addTarget(self, action: #selector(userPasswordEditButtonTap), for: .touchUpInside)
        
        //전달받은 데이터를 표시
        if let profileimage = receivedProfileImage {
            manageprofileview.profileImage.image = profileimage
        }
    }
    
    private var manageprofileview: ManageProfileView = {
        let view = ManageProfileView()
        return view
    }()
    
    //프로필이미지 받을 public 변수 선언
    public var receivedProfileImage: UIImage?
    
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
        manageprofileview.userEmailTextField.placeholder = " " // 빈거 어케 하는지 모름..
        manageprofileview.userEmailTextField.isUserInteractionEnabled = true
        manageprofileview.userEmailEditButton.setTitle("완료", for: .normal)
    }
    
    //변경 버튼 눌렸을때 패스워드 텍스트필드 없어지고 완료 버튼 누르기
    @objc
    private func userPasswordEditButtonTap() {
        manageprofileview.userEmailTextField.placeholder = " "
        manageprofileview.userPasswordTextField.isUserInteractionEnabled = true
        manageprofileview.userPasswordEditButton.setTitle("완료", for: .normal)
    }
    
    //확인 누르면 수정된 값 새롭게 userdefaults에 저장
    @objc
    private func userEmailEditDoneButtonTap() {
        
    }
    @objc
    private func userPasswordEditDoneButtonTap() {
        
    }
}
