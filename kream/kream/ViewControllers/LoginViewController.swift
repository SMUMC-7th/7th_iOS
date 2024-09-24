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
        // Do any additional setup after loading the view.
        
        self.view = loginview
    }
    
    private lazy var loginview : LoginView = {
        let login = LoginView()
        
        return login
    } ()


}

