//
//  LoginView.swift
//  kream
//
//  Created by 유시은 on 9/24/24.
//

import UIKit

class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var kreamLogo : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false // 무조건 해야함(그래야 마음대로 조작할 수 있음)
        image.image = UIImage(named : "kreamLogo")
        image.contentMode = .scaleAspectFit // 중요함 나중에 공부하기
        
        return image
    }()
    
    private lazy var emailAdress : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "이메일 주소"
        label.font = UIFont.systemFont(ofSize: 15, weight: .thin)
        
        return label
    }()
    
    private lazy var password : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 15, weight: .thin)
        
        return label
    }()
    
    public lazy var idEnter : UITextField = {
        let login = UITextField()
        login.translatesAutoresizingMaskIntoConstraints = false
        login.placeholder = "예) kream@kream.co.kr"
        login.font = UIFont.systemFont(ofSize: 15, weight: .thin)
        
        login.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        login.leftViewMode = .always
        
        login.layer.borderWidth = 1
        login.layer.borderColor = UIColor.gray.cgColor
        
        login.layer.cornerRadius = 15 // 객체의 모서리를 둥글게
        login.clipsToBounds = true
        
        login.textColor = .black
        
        return login
    }()
    
    public lazy var passwordEnter : UITextField = {
        // passwordEnterTextField 수정
        // 다른 것들도 일괄수정
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.placeholder = "비밀번호를 입력해주세요"
        password.font = UIFont.systemFont(ofSize: 15, weight: .thin)
        
        password.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        password.leftViewMode = .always
        
        password.layer.borderWidth = 1
        password.layer.borderColor = UIColor.gray.cgColor
        
        password.layer.cornerRadius = 15 // 객체의 모서리를 둥글게
        password.clipsToBounds = true
        
        password.textColor = .black
        
        return password
    }()
    
    public lazy var loginButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
        
        button.layer.cornerRadius = 10 // 객체의 모서리를 둥글게
        button.clipsToBounds = true
        
        return button
    }()
    
    private lazy var kakaoLogin : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("카카오로 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0).cgColor
        
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        
        return button
    }()
    
    private lazy var appleLogin : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Apple로 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0).cgColor
        
        button.layer.cornerRadius = 10 // 객체의 모서리를 둥글게
        button.clipsToBounds = true
        
        return button
    }()
    
    public lazy var kakaoLogo : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false // 무조건 해야함(그래야 마음대로 조작할 수 있음)
        image.image = UIImage(named : "kakaoLogo")
        image.contentMode = .scaleAspectFit // 중요함 나중에 공부하기
        
        return image
    }()
    
    public lazy var appleLogo : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false // 무조건 해야함(그래야 마음대로 조작할 수 있음)
        image.image = UIImage(named : "appleLogo")
        image.contentMode = .scaleAspectFit // 중요함 나중에 공부하기
        
        return image
    }()
    
    private func addComponents() {
        self.addSubview(kreamLogo)
        self.addSubview(emailAdress)
        self.addSubview(idEnter)
        self.addSubview(password)
        self.addSubview(passwordEnter)
        self.addSubview(loginButton)
        self.addSubview(kakaoLogin)
        self.addSubview(appleLogin)
        self.addSubview(kakaoLogo)
        self.addSubview(appleLogo)
        
        NSLayoutConstraint.activate([
            kreamLogo.topAnchor.constraint(equalTo: self.topAnchor, constant: 126),
            kreamLogo.widthAnchor.constraint(equalToConstant: 287), // 가로 길이
            kreamLogo.heightAnchor.constraint(equalToConstant: 75),
            kreamLogo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            emailAdress.topAnchor.constraint(equalTo: kreamLogo.bottomAnchor, constant: 87),
            emailAdress.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            
            idEnter.topAnchor.constraint(equalTo: emailAdress.bottomAnchor, constant: 8),
            idEnter.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            idEnter.widthAnchor.constraint(equalToConstant: 303),
            idEnter.heightAnchor.constraint(equalToConstant: 34),
            idEnter.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            password.topAnchor.constraint(equalTo: idEnter.bottomAnchor, constant: 17),
            password.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            
            
            passwordEnter.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 8),
            passwordEnter.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            passwordEnter.widthAnchor.constraint(equalToConstant: 303),
            passwordEnter.heightAnchor.constraint(equalToConstant: 34),
            passwordEnter.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            loginButton.topAnchor.constraint(equalTo: passwordEnter.bottomAnchor, constant: 17),
            loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginButton.leadingAnchor.constraint(equalTo: passwordEnter.leadingAnchor, constant: 0),
            loginButton.widthAnchor.constraint(lessThanOrEqualToConstant: 303),
            loginButton.heightAnchor.constraint(equalToConstant: 38),
            
            
            kakaoLogin.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 87),
            kakaoLogin.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            kakaoLogin.widthAnchor.constraint(equalToConstant: 298),
            kakaoLogin.heightAnchor.constraint(equalToConstant: 40),
            kakaoLogin.leadingAnchor.constraint(equalTo: passwordEnter.leadingAnchor, constant: 0),
            
            kakaoLogo.topAnchor.constraint(equalTo: kakaoLogin.topAnchor, constant: 13),
            kakaoLogo.leadingAnchor.constraint(equalTo: kakaoLogin.leadingAnchor, constant: 17),
            kakaoLogo.widthAnchor.constraint(equalToConstant: 15),
            kakaoLogo.heightAnchor.constraint(equalToConstant: 14),
            
            appleLogo.topAnchor.constraint(equalTo: appleLogin.topAnchor, constant: 13),
            appleLogo.leadingAnchor.constraint(equalTo: appleLogin.leadingAnchor, constant: 17),
            appleLogo.widthAnchor.constraint(equalToConstant: 15),
            appleLogo.heightAnchor.constraint(equalToConstant: 14),
            
            appleLogin.topAnchor.constraint(equalTo: kakaoLogin.bottomAnchor, constant: 22),
            appleLogin.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            appleLogin.widthAnchor.constraint(equalToConstant: 298),
            appleLogin.heightAnchor.constraint(equalToConstant: 40),
            appleLogin.leadingAnchor.constraint(equalTo: passwordEnter.leadingAnchor, constant: 0),
        ])
    }
}

import SwiftUI
#Preview
{
    LoginViewController()
}
