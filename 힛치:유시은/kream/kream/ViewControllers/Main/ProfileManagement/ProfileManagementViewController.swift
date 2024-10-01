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
        
    }
    



    private lazy var profilemanagementview : ProfileManagementView = {
        let profilemanagement = ProfileManagementView()
        
        return profilemanagement
    }()
    

    
}

import SwiftUI
#Preview
{
    ProfileManagementViewController()
}

