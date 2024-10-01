//
//  MainMyViewController.swift
//  kream
//
//  Created by 유시은 on 10/1/24.
//

// MY 수정하기

import UIKit

class MainMyViewController: UIViewController {

//    private let label = UILabel()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        label.text = "MY 화면"
//        label.textColor = .black
//        
//        view.addSubview(label)
//        
//        label.snp.makeConstraints {
//            $0.centerX.equalToSuperview()
//            $0.centerY.equalToSuperview()
//        }
//    }
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        self.view = mypageview
        
//        loginview.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        
    }
    
    private lazy var mypageview : MyPageView = {
        let mypage = MyPageView()
        return mypage
    } ()

}

import SwiftUI
#Preview
{
    MainMyViewController()
}

