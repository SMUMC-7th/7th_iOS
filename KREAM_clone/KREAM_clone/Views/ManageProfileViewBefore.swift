import UIKit

class ManageProfileViewBefore: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addComponent()
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ProfileImage")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public lazy var profileInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필 정보"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    public lazy var userEmailLabel: UILabel = {
        let label = UILabel()
        label.text = "유저 이메일"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var userEmailTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        let placeholder = "새로운 이메일을 입력해주세요!"
        //attribute 딕셔너리를 정의해서 폰트 스타일, 색상 바꾸기
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor(hex: "#A2A2A2")?.cgColor ?? UIColor.gray.cgColor
        ]
        
        //placeholder이랑 attribute를 연결시켜줌 : attribute를 placeholder에 적용시키기
        textfield.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        
        //위치 설정
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: textfield.frame.height))
            textfield.leftView = paddingView
            textfield.leftViewMode = .always
        
        textfield.textColor = .black
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 10
        textfield.layer.borderColor = UIColor(hex: "#D5D5D5")?.cgColor
        
        return textfield
    }()
    
    public lazy var userEmailChangeEditButton : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public lazy var userPwdLabel: UILabel = {
        let label = UILabel()
        label.text = "유저 비밀번호"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public lazy var userPwdTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        let placeholder = "새로운 비밀번호을 입력해주세요!"
        //attribute 딕셔너리를 정의해서 폰트 스타일, 색상 바꾸기
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor(hex: "#A2A2A2")?.cgColor ?? UIColor.gray.cgColor
        ]
        
        //placeholder이랑 attribute를 연결시켜줌 : attribute를 placeholder에 적용시키기
        textfield.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        
        //위치 설정
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: textfield.frame.height))
            textfield.leftView = paddingView
            textfield.leftViewMode = .always
        
        textfield.textColor = .black
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 10
        textfield.layer.borderColor = UIColor(hex: "#D5D5D5")?.cgColor
        
        return textfield
    }()
    
    public lazy var userPwdChangeEditButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    public func addComponent() {
        self.addSubview(profileImage)
        self.addSubview(profileInfoLabel)
        self.addSubview(userEmailLabel)
        self.addSubview(userEmailTextField)
        self.addSubview(userEmailChangeEditButton)
        self.addSubview(userPwdLabel)
        self.addSubview(userPwdTextField)
        self.addSubview(userPwdChangeEditButton)
        
        profileImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview() // 수평 중앙 정렬
            make.top.equalTo(self.safeAreaLayoutGuide).offset(98)
            make.width.height.equalTo(90) //크기 설정
        }
        profileInfoLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(27)
            make.top.equalTo(profileImage.snp.bottom).offset(20)
        }
        userEmailLabel.snp.makeConstraints { make in
            make.top.equalTo(profileInfoLabel.snp.bottom).offset(23)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(27)
        }
        userEmailTextField.snp.makeConstraints { make in
            make.top.equalTo(userEmailLabel.snp.bottom).offset(4)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(27)
            make.width.equalTo(282)
            make.height.equalTo(32)
        }
        userEmailChangeEditButton.snp.makeConstraints{ make in
            make.top.equalTo(userEmailLabel.snp.bottom).offset(4)
            make.leading.equalTo(userEmailTextField.snp.trailing).offset(9)
            make.width.equalTo(58)
            make.height.equalTo(32)
        }
        userPwdLabel.snp.makeConstraints{ make in
            make.top.equalTo(userEmailChangeEditButton.snp.bottom).offset(23)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(27)
        }
        userPwdTextField.snp.makeConstraints { make in
            make.top.equalTo(userPwdLabel.snp.bottom).offset(4)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(27)
            make.width.equalTo(282)
            make.height.equalTo(32)
        }
        userPwdChangeEditButton.snp.makeConstraints{ make in
            make.top.equalTo(userPwdLabel.snp.bottom).offset(4)
            make.leading.equalTo(userPwdTextField.snp.trailing).offset(9)
            make.width.equalTo(58)
            make.height.equalTo(32)
        }
        
        }
    }
    
    

