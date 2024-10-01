//
//  TabBarViewController.swift
//  Kream
//
//  Created by 이승준 on 9/29/24.
//

import UIKit

class TabBarViewController: UITabBarController {
    private let homeVC = UINavigationController(rootViewController: HomeViewController())
    private let styleVC = UINavigationController(rootViewController: StyleViewController())
    private let shopVC =  UINavigationController(rootViewController: ShopViewController())
    private let savedVC = UINavigationController(rootViewController: SavedViewController())
    private let myProfileVC = UINavigationController(rootViewController: MyProfileViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(systemName: "house"), tag: 0)
        styleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(systemName: "heart.text.clipboard"), tag: 1)
        shopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(systemName: "text.page.badge.magnifyingglass"), tag: 2)
        savedVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(systemName: "bookmark"), tag: 3)
        myProfileVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(systemName: "person"), tag: 4)
        
        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, myProfileVC]
    }

}
