//
//  MainMyViewController.swift
//  kream
//
//  Created by 유시은 on 10/1/24.
//

// MY 수정하기

import UIKit

class MainMyViewController: UIViewController {
    
    private lazy var mypageview : MyPageView = {
        let mypage = MyPageView()
        
        mypage.manageProfileButton.addTarget(self, action: #selector(manageProfileButtonDidTap), for: .touchUpInside)
        
        return mypage
    } ()
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        self.view = mypageview
    }
    
    @objc
    public func manageProfileButtonDidTap() {
        let profileManagementViewController = ProfileManagementViewController()
        
        navigationController?.pushViewController(profileManagementViewController, animated: true)

    }

    
}

import SwiftUI
#Preview
{
    MainViewController()
}

