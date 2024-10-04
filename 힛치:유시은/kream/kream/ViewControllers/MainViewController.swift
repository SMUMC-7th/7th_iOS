//
//  MainViewController.swift
//  kream
//
//  Created by 유시은 on 10/1/24.
//

import UIKit

class MainViewController: UITabBarController {
    
    private let mainHomeVC = MainHomeViewController()
    private let mainStyleVC = MainStyleViewController()
    private let mainShopVC = MainShopViewController()
    private let mainSavedVC = MainSavedViewController()
    private let mainMyVC = UINavigationController(rootViewController: MainMyViewController())
   

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        mainHomeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named : "home"), tag: 0)
        mainStyleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named: "style"), tag: 1)
        mainShopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named: "shop"), tag: 2)
        mainSavedVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(named: "saved"), tag: 3)
        mainMyVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named: "my"), tag: 4)
        
        self.viewControllers = [mainHomeVC, mainStyleVC, mainShopVC, mainSavedVC, mainMyVC]
        
//        // 탭 바 아이템의 색상을 모두 검정색으로 설정
//            if let tabBar = self.tabBar as? UITabBar {
//                tabBar.tintColor = .black // 선택된 탭 아이템의 색상
//                tabBar.unselectedItemTintColor = .black // 선택되지 않은 탭 아이템의 색상
//
//            }
    }
}

import SwiftUI
#Preview
{
    MainViewController()
}

