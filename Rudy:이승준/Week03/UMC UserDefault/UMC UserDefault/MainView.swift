//
//  view.swift
//  UMC UserDefault
//
//  Created by 이승준 on 10/5/24.
//

import UIKit

class MainView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "UserDefaults 실습 뷰"
        return label
    }()
    
    public lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "아무 텍스트나 입력해주세요."
        return textField
    }()
    
    public lazy var saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("UserDefaults에 저장하기", for: .normal)
        button.backgroundColor = .gray
        button.titleLabel?.textColor = .red
        return button
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "UserDefaults 값 출력 라벨"
        return label
    }()
    
    public lazy var outputLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "UserDefaults 값이 출력됩니다."
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    private func addComponents() {
        self.addSubview(titleLabel)
        self.addSubview(textField)
        self.addSubview(saveButton)
        self.addSubview(subTitleLabel)
        self.addSubview(outputLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
            
            textField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            
            saveButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            saveButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 30),
            
            subTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            subTitleLabel.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 100),
            
            outputLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            outputLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 30),
            outputLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            outputLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

import SwiftUI
#Preview{
    ViewController()
}
