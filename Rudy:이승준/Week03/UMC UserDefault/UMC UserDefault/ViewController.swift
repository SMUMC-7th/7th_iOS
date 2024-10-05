//
//  ViewController.swift
//  UMC UserDefault
//
//  Created by 이승준 on 10/5/24.
//

import UIKit

class ViewController: UIViewController {

    let userDefaults = UserDefaults.standard
    
    private lazy var mainView : MainView = {
        let view = MainView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        self.refreshLabel()
        self.mainView.saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside )
    }
    
    @objc private func saveButtonPressed() {
        print("save btn pressed")
        if let text = mainView.textField.text {
            print("save btn pressed + txtf is not empty")
            userDefaults.set(text, forKey: "basic")
            mainView.textField.text = nil
            refreshLabel()
        }
    }
    
    private func refreshLabel() {
        if let text = userDefaults.string(forKey: "basic") {
            mainView.outputLabel.text = text
        }
    }


}

import SwiftUI
#Preview{
    ViewController()
}
