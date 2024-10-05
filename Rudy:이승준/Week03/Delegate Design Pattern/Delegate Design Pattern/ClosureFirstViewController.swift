//
//  ClosureFirstViewController.swift
//  Delegate Design Pattern
//
//  Created by 이승준 on 10/5/24.
//

import UIKit

class ClosureFirstViewController: UIViewController {

    // UI 요소들 선언
        private lazy var label: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "전달된 데이터 없음"
            return label
        }()
        
        private lazy var button: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("두 번째 화면으로", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            setupViews()
        }
        
        func setupViews() {
            view.addSubview(label)
            view.addSubview(button)
            
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                
                button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
                button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
            
            // 버튼 클릭 시 두 번째 화면으로 전환
            button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        }
        
        @objc func didTapButton() {
            let secondVC = ClosureSecondViewController()
            
            // 클로저를 설정하여 두 번째 화면에서 데이터를 전달받음
            secondVC.completionHandler = { [weak self] data in
                self?.label.text = data
            }
            
            // 화면 전환
            navigationController?.pushViewController(secondVC, animated: true)
        }
}
