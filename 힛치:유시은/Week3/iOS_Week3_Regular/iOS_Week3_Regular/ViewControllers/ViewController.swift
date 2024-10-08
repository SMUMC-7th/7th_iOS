//
//  ViewController.swift
//  iOS_Week3_Regular
//
//  Created by 유시은 on 10/5/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let userDefaultsModel = UserDefaultModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = userDefaultsview
        loadTextValue()
    }
    
    private lazy var userDefaultsview: UserDefaultsView = {
        let view = UserDefaultsView()
        view.saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
        return view
    }()

    @objc func saveButtonClicked() {
        guard let text = userDefaultsview.inputTextField.text,
              !text.isEmpty
        else {
            return
        }
        
        userDefaultsModel.saveUserText(text)
        
        userDefaultsview.showTextValue.text = text
    }
    
    private func loadTextValue() {
        if let savedText = userDefaultsModel.loadUserText() {
            userDefaultsview.showTextValue.text = savedText
        }
    }
}


