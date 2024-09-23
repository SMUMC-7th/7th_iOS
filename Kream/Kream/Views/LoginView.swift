
import UIKit

class LoginView: UIView {
    
    private lazy var imageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "KREAM LOGO")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var emailLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "이메일 주소"
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "예)kream@kream.co.kr"
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 15
        
        // leftView에 패딩 추가
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private lazy var pwdLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "비밀번호"
        label.widthAnchor.constraint(equalToConstant: 303).isActive = true
        return label
    }()
    
    private lazy var pwdTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.widthAnchor.constraint(equalToConstant: 303).isActive = true
        textField.placeholder = "비밀번호를 입력해주세요."
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 15
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = UIColor(named: "LoginButtonGray")
        button.layer.cornerRadius = 5
        return button
    }()
    
    private lazy var customerLoginStack: UIStackView = {
        let stackView: UIStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField, pwdLabel, pwdTextField, loginButton])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var kakaoLoginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("카카오로 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        button.setImage(UIImage(systemName: "message.fill"), for: .normal)
        button.imageView?.tintColor = .black
        button.imageView?.contentMode = .scaleAspectFit
        
        button.contentHorizontalAlignment = .center
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -100, bottom: 0, right: 0)
        
        
        button.layer.borderColor = UIColor(named: "LoginButtonGray")?.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    public lazy var appleLoginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Apple로 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        button.setImage(UIImage(systemName: "apple.logo"), for: .normal)
        
        button.imageView?.tintColor = .black
        button.imageView?.contentMode = .scaleAspectFit
        
        button.contentHorizontalAlignment = .leading
        button.contentVerticalAlignment = .center
        
        button.layer.borderColor = UIColor(named: "LoginButtonGray")?.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 15
        
        button.contentHorizontalAlignment = .center
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -100, bottom: 0, right: 0)
        
        
        return button
    }()
    
    private lazy var socialLoginStack: UIStackView = {
        let stackView: UIStackView = UIStackView(arrangedSubviews: [kakaoLoginButton, appleLoginButton])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    private func addComponents() {
        self.addSubview(imageView)
        
        self.addSubview(customerLoginStack)
        customerLoginStack.addSubview(emailTextField)
        customerLoginStack.addSubview(pwdTextField)
        customerLoginStack.addSubview(loginButton)
        
        self.addSubview(socialLoginStack)
        socialLoginStack.addSubview(kakaoLoginButton)
        socialLoginStack.addSubview(appleLoginButton)
        
        appleLoginButton.addSubview(appleLoginButton.imageView!)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 180),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 75),
            
            customerLoginStack.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            customerLoginStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            customerLoginStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45),
            
            emailTextField.leadingAnchor.constraint(equalTo: customerLoginStack.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: customerLoginStack.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            pwdTextField.leadingAnchor.constraint(equalTo: customerLoginStack.leadingAnchor),
            pwdTextField.trailingAnchor.constraint(equalTo: customerLoginStack.trailingAnchor),
            pwdTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.leadingAnchor.constraint(equalTo: customerLoginStack.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: customerLoginStack.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            socialLoginStack.topAnchor.constraint(equalTo: customerLoginStack.bottomAnchor, constant: 50),
            socialLoginStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            socialLoginStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45),
            
            kakaoLoginButton.leadingAnchor.constraint(equalTo: self.socialLoginStack.leadingAnchor),
            kakaoLoginButton.trailingAnchor.constraint(equalTo: self.socialLoginStack.trailingAnchor),
            kakaoLoginButton.heightAnchor.constraint(equalToConstant: 40),
            
            appleLoginButton.leadingAnchor.constraint(equalTo: self.socialLoginStack.leadingAnchor),
            appleLoginButton.trailingAnchor.constraint(equalTo: self.socialLoginStack.trailingAnchor),
            appleLoginButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
