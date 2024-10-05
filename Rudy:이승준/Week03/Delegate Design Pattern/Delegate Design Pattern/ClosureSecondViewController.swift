//
//  ClosureSecondViewController.swift
//  Delegate Design Pattern
//
//  Created by 이승준 on 10/5/24.
//

import UIKit

class ClosureSecondViewController: UIViewController {

    // 데이터를 전달할 클로저 타입의 변수 선언
    var completionHandler: ((String) -> Void)?
    
    // UI 요소들 선언
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "데이터를 입력해주세요"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("데이터 전달하기", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(textField)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // 버튼 클릭 시 클로저를 통해 데이터를 전달
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        // 사용자가 입력한 텍스트를 클로저를 통해 전달하고 화면을 이전으로 전환
        if let text = textField.text {
            completionHandler?(text)
            navigationController?.popViewController(animated: true)
        }
    }

}
