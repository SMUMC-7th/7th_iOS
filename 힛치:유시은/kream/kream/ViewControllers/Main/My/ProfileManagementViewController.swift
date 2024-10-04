//
//  ProfileManagementViewController.swift
//  kream
//
//  Created by 유시은 on 10/1/24.
//

import UIKit
 
class ProfileManagementViewController: UIViewController {
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        self.view = profilemanagementview
        
        setUpNavigationBar()
    }
    
    private lazy var profilemanagementview : ProfileManagementView = {
        let profilemanagement = ProfileManagementView()
                        
        return profilemanagement
    }()
    
    public func setUpNavigationBar() {
        let backButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .done, target: self, action: #selector(backButtonDidTap))
        backButtonItem.tintColor = .black
        self.navigationItem.hidesBackButton = true 
        self.navigationItem.leftBarButtonItem = backButtonItem
    }
    
    @objc
    public func backButtonDidTap() {
        let mainMyViewController = MainMyViewController()
        
        navigationController?.popViewController(animated: true)
    }
}

import SwiftUI
#Preview
{
    //ProfileManagementViewController()
    MainViewController()
}

