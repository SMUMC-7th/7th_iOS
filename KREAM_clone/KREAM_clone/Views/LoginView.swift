import Foundation
import UIKit

class LoginView: UIView {
    
    override init(frame:CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var kreamlogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "KreamLogo")
        imageView.contentMode = .scaleAspectFit //똑같은 크기로 넣음
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    public var emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "예) kream@kream.co.kr"
        textfield.textColor = .black
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 15
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    public var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    public var passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "비밀번호를 입력해주세요"
        textfield.textColor = .black
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 15
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    public var loginButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Login"),for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public var kakaoLoginButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "KakaoLogin"), for: .normal)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    public var appleLoginButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "AppleLogin"), for: .normal)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public func addComponent() {
        self.addSubview(kreamlogo)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(kakaoLoginButton)
        self.addSubview(appleLoginButton)
        
        NSLayoutConstraint.activate([
            kreamlogo.topAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.topAnchor, constant: 126),
            kreamlogo.leadingAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 53),
            kreamlogo.widthAnchor.constraint(lessThanOrEqualToConstant: 287),
            kreamlogo.heightAnchor.constraint(lessThanOrEqualToConstant: 75),
            
            emailLabel.topAnchor.constraint(lessThanOrEqualTo: kreamlogo.bottomAnchor, constant: 87),
            emailLabel.leadingAnchor.constraint(greaterThanOrEqualTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            
            emailTextField.topAnchor.constraint(lessThanOrEqualTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            emailTextField.trailingAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -45),
            emailTextField.widthAnchor.constraint(lessThanOrEqualToConstant: 303),
            emailTextField.heightAnchor.constraint(lessThanOrEqualToConstant: 34),
            
            passwordLabel.topAnchor.constraint(lessThanOrEqualTo: emailTextField.bottomAnchor, constant: 17),
            passwordLabel.leadingAnchor.constraint(greaterThanOrEqualTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            
            passwordTextField.topAnchor.constraint(lessThanOrEqualTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            passwordTextField.trailingAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -45),
            passwordTextField.heightAnchor.constraint(lessThanOrEqualToConstant: 34),
            
            loginButton.topAnchor.constraint(lessThanOrEqualTo: passwordTextField.bottomAnchor, constant: 17),
            loginButton.leadingAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            loginButton.trailingAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 45),
            loginButton.heightAnchor.constraint(lessThanOrEqualToConstant: 38),
            
            kakaoLoginButton.topAnchor.constraint(lessThanOrEqualTo: loginButton.bottomAnchor, constant: 87),
            kakaoLoginButton.leadingAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            kakaoLoginButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -45),
            kakaoLoginButton.heightAnchor.constraint(lessThanOrEqualToConstant: 40),
            
            appleLoginButton.topAnchor.constraint(lessThanOrEqualTo: kakaoLoginButton.bottomAnchor, constant: 22),
            appleLoginButton.leadingAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            appleLoginButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -45),
            appleLoginButton.heightAnchor.constraint(lessThanOrEqualToConstant: 40),
            ])
    }
}
