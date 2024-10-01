//
//  MainMyViewController.swift
//  kream
//
//  Created by 유시은 on 10/1/24.
//

// MY 수정하기

import UIKit

class MainMyViewController: UIViewController {
    
    //private let navigationVC = UINavigationController(rootViewController: MainMyViewController())
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        self.view = mypageview
        
    }
    
    private lazy var mypageview : MyPageView = {
        let mypage = MyPageView()
        
        // 네비게이션으로변경
        mypage.manageProfileButton.addTarget(self, action: #selector(manageProfileButtonDidTap), for: .touchUpInside)
        
        return mypage
    } ()
    
    
    @objc
    private func manageProfileButtonDidTap() {
        let profileManagementViewController = ProfileManagementViewController()
        
        profileManagementViewController.modalPresentationStyle = .fullScreen
        
        //navigationController?.pushViewController(profileManagementViewController, animated: true)
        
         present(profileManagementViewController, animated: true)
    }
    
    

}

import SwiftUI
#Preview
{
    MainMyViewController()
}

