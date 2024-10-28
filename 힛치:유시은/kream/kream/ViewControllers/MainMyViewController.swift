//
//  MainMyViewController.swift
//  kream
//
//  Created by 유시은 on 10/1/24.
//

// MY 수정하기

import UIKit

class MainMyViewController: UIViewController {
    
    // 데이터(사진)를 전달할 클로저 타입의 변수 선언
    var completionHandler: ((UIImage) -> Void)?
    
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
        
        if let profileImage = mypageview.profileImage.image {
            // 사용자가 입력한 프로필 이미지를 클로저를 통해 전달
            completionHandler?(profileImage)
            // 화면을 이전으로 전환
            navigationController?.pushViewController(profileManagementViewController, animated: true)
        }
    }
}

import SwiftUI
#Preview
{
    MainViewController()
    //MyPageView()
}

