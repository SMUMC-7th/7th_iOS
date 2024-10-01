//
//  ViewController.swift
//  iOS_Week1_Regular
//
//  Created by 유시은 on 9/27/24.
//

import UIKit

class ViewController: UIViewController {
    
    var data: CountUpDownModel = CountUpDownModel(count: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = counterView
        //self.view.backgroundColor = .white
    }
    
    private lazy var counterView: CountUpDownView = {
        let view = CountUpDownView()
        //view.countLabel.text = "1"
        view.countDownButton.addTarget(self, action: #selector(decreaaseCount), for: .touchUpInside)
        view.countUpButton.addTarget(self, action: #selector(increaseCount), for: .touchUpInside)
        return view
    }()
    
    @objc func increaseCount() {
        self.data.increaseCount()
        self.updateCount()
    }
    
    @objc func decreaaseCount() {
        self.data.decreaseCount()
        self.updateCount()
    }
    
    private func updateCount() {
        self.counterView.countLabel.text = String(data.count)
    }
}



