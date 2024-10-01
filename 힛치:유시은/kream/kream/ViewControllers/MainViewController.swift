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
    private let mainMyVC = MainMyViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        mainHomeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named : "home"), tag: 0)
        mainStyleVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "style"), tag: 1)
        mainShopVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "shop"), tag: 2)
        mainSavedVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "saved"), tag: 3)
        mainMyVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "my"), tag: 4)
        
        self.viewControllers = [mainHomeVC, mainStyleVC, mainShopVC, mainSavedVC, mainMyVC]
    }
    
    // 여기서 tabbaritem 크기 조정하기

}

import SwiftUI
#Preview
{
    MainViewController()
}

