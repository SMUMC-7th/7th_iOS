//
//  BaseViewController.swift
//  Week01 Workbook
//
//  Created by 이승준 on 9/29/24.
//

import UIKit

class BaseViewController: UITabBarController {
    private let modalVC = ModalViewController()
    private let navigationVC = UINavigationController(rootViewController: NavigationViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        modalVC.tabBarItem = UITabBarItem(
            title: "modalVC",
            image: UIImage(systemName: "apple.terminal"),
            tag: 0)
        navigationVC.tabBarItem = UITabBarItem(
            title: "modalVC",
            image: UIImage(systemName: "tray.full"),
            tag: 1)
        
        self.viewControllers = [modalVC, navigationVC]
    }
    

}

import SwiftUI
#Preview {
    BaseViewController()
}
