//
//  MainShopViewController.swift
//  kream
//
//  Created by 유시은 on 10/1/24.
//

import UIKit

class MainShopViewController: UIViewController {

    private let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = "SHOP 화면"
        label.textColor = .black
        
        view.addSubview(label)
        
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }

}
