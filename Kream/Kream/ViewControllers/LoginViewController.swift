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
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }

}

import SwiftUI

#Preview
{
    LoginViewController()
}
