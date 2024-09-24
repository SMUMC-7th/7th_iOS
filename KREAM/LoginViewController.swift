//
//  ViewController.swift
//  KREAM
//
//  Created by Dana Lim on 9/24/24.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginview
        
    }

    private var loginview: LoginView = {
        let view = LoginView()
        return view
    }()
}

import SwiftUI
#Preview
{
    LoginViewController()
}
