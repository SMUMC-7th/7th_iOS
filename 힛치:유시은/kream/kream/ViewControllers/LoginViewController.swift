//
//  ViewController.swift
//  kream
//
//  Created by 유시은 on 9/24/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let loginUserDefaultsModel = LoginUserDefaultsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginview
    }
    
    private lazy var loginview : LoginView = {
        let login = LoginView()
        login.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return login
    }()

    @objc
    private func loginButtonDidTap() {
        let mainViewController = MainViewController()
        mainViewController.modalPresentationStyle = .fullScreen
        present(mainViewController, animated: true)
        
        guard let id = loginview.idEnter.text, !id.isEmpty else {
            return
        }
        
        guard let password = loginview.passwordEnter.text, !password.isEmpty else {
            return
        }
        
        loginUserDefaultsModel.saveUserId(id)
        loginUserDefaultsModel.saveUserPassword(password)
        
        let profileManagementViewController = ProfileManagementViewController()
        
        profileManagementViewController.userId = id
        profileManagementViewController.userPassword = password
    }
}

import SwiftUI
#Preview
{
    LoginViewController()
}

