//
//  ViewController.swift
//  kream
//
//  Created by 유시은 on 9/24/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        self.view = loginview
        
        loginview.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        
    }
    
    private lazy var loginview : LoginView = {
        let login = LoginView()
        return login
    } ()

    @objc
    private func loginButtonDidTap() {
        let mainViewController = MainViewController()
        
        mainViewController.modalPresentationStyle = .fullScreen
        
        present(mainViewController, animated: true)
    }
    
}

import SwiftUI
#Preview
{
    LoginViewController()
}

