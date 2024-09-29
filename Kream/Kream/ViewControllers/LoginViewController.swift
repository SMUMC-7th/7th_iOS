//
//  ViewController.swift
//  Kream
//
//  Created by 이승준 on 9/23/24.
//

import UIKit

class LoginViewController: UIViewController {

    private lazy var loginView: LoginView = {
        let view = LoginView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.appleLoginButton.addTarget(self, action: #selector(appleLoginTapped), for: .touchUpInside)
        //view.kakaoLoginButton.addTarget(self, action: #selector(kakaoLoginTapped), for: .touchUpInside)
        view.loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return view
    }()
    
    private let navigationVC = UINavigationController(rootViewController: TabBarViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }
    
    @objc
    private func loginTapped() {
        let tabBarVC = TabBarViewController()
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC,animated: true)
    }
    
    @objc
    private func appleLoginTapped() {
        print("appleLoginTapped")
    }
    
    @objc
    private func kakaoLoginTapped() {
        print("kakaoLoginTapped")
    }
    
}
