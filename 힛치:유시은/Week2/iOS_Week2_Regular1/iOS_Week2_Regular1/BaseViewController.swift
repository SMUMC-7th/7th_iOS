//
//  BaseViewController.swift
//  iOS_Week2_Regular
//
//  Created by 유시은 on 9/29/24.
//

import UIKit

class BaseViewController: UITabBarController {

    private let modalVC = ModalViewController()
    private let navigationVC = UINavigationController(rootViewController: NavigationViewController()) 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        modalVC.tabBarItem = UITabBarItem(title: "modalVC", image: UIImage(systemName: "apple.terminal"), tag: 0)
        navigationVC.tabBarItem = UITabBarItem(title: "navigationVC", image: UIImage(systemName: "tray.full"), tag: 1)
        
        viewControllers = [modalVC, navigationVC]

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

import SwiftUI
#Preview
{
    BaseViewController()
}
