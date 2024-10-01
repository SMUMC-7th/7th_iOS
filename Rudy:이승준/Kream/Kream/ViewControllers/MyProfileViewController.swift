//
//  MyProfileViewController.swift
//  Kream
//
//  Created by 이승준 on 9/29/24.
//

import UIKit
import SnapKit

class MyProfileViewController: UIViewController {
    
    private lazy var myProfileView = MyProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myProfileView
        myProfileView.editProfileButton.addTarget(self, action: #selector(pushEditProfileView), for: .touchUpInside)
        self.navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    @objc
    private func pushEditProfileView() {
        let editView = EditMyProfileViewController()
        navigationController?.pushViewController(editView, animated: false)
    }

}

import SwiftUI
#Preview {
    MyProfileViewController()
}
