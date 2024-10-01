//
//  SavedViewController.swift
//  Kream
//
//  Created by 이승준 on 9/29/24.
//

import UIKit
import SnapKit

class SavedViewController: UIViewController {
    
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "This is SavedView"
        
        view.addSubview(label)
        
        label.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
    }

}
