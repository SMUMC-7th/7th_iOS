//
//  LoginView.swift
//  kream
//
//  Created by 유시은 on 9/24/24.
//

import UIKit

class LoginView: UIView {
    
    
    public lazy var logo : UIImageView = {
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
        
        return label
    }()
    
    private lazy var password : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "비밀번호"
        
        return label
    }()
    
    private lazy var idEnter : UITextField = {
        let login = UITextField()
        login.translatesAutoresizingMaskIntoConstraints = false
        login.placeholder = "예) kream@kream.co.kr"
        
        login.layer.borderWidth = 1
        login.layer.borderColor = UIColor.gray.cgColor
        
        return login
    }()
    
    private lazy var passwordEnter : UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.placeholder = "비밀번호를 입력해주세요"
        
        password.layer.borderWidth = 1
        password.layer.borderColor = UIColor.gray.cgColor
        
        return password
    }()
    
    
    
    private lazy var loginButton : UIButton = {
        let botton = UIButton()
        botton.translatesAutoresizingMaskIntoConstraints = false
        botton.setTitle("로그인", for: .normal)
        botton.backgroundColor = .gray
        
        
        return botton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents() {
        self.addSubview(logo)
        self.addSubview(emailAdress)
        self.addSubview(idEnter)
        self.addSubview(password)
        self.addSubview(passwordEnter)
        self.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            //logo.leftAnchor.constraint(equalTo: self.leftAnchor, constant: -),
            logo.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
            //logo.widthAnchor.constraint(equalToConstant: 180),
            logo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            emailAdress.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 70),
            emailAdress.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 33),
            idEnter.topAnchor.constraint(equalTo: emailAdress.bottomAnchor, constant: 10),
            idEnter.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 33),
            
            password.topAnchor.constraint(equalTo: idEnter.bottomAnchor, constant: 20),
            password.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 33),
            passwordEnter.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 10),
            passwordEnter.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 33),
            
            loginButton.topAnchor.constraint(equalTo: passwordEnter.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            
            
        ])
        
        
        
    }
    
    
    
}


import SwiftUI
#Preview
{
    LoginViewController()
}
