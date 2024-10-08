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
        self.addTabBarIcons()
    }

    private func addTabBarIcons() {
        
        let size = CGSize(width: 30, height: 30)
        
        let homeIcon = UIImage(named: "Home Icon")
        let resizedHomeIcon = homeIcon?.resizeImage(to: size)
        
        let styleIcon = UIImage(named: "Style Icon")
        let resizedStyleIcon = styleIcon?.resizeImage(to: size)
        
        let shopIcon = UIImage(named: "Shop Icon")
        let resizedShopIcon = shopIcon?.resizeImage(to: size)
        
        let savedIcon = UIImage(named: "Saved Icon")
        let resizedSavedIcon = savedIcon?.resizeImage(to: size)
        
        let myIcon = UIImage(named: "My Icon")
        let resizedMyIcon = myIcon?.resizeImage(to: size)
        
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: resizedHomeIcon, tag: 0)
        styleVC.tabBarItem = UITabBarItem(title: "STYLE", image: resizedStyleIcon, tag: 1)
        shopVC.tabBarItem = UITabBarItem(title: "SHOP", image: resizedShopIcon, tag: 2)
        savedVC.tabBarItem = UITabBarItem(title: "SAVED", image: resizedSavedIcon, tag: 3)
        myProfileVC.tabBarItem = UITabBarItem(title: "MY", image: resizedMyIcon, tag: 4)
        
        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, myProfileVC]
    }
    
}

extension UIImage {
    func resizeImage(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(origin: .zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}
