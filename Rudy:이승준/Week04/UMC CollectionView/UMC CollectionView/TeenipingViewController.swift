//
//  ViewController.swift
//  UMC CollectionView
//
//  Created by 이승준 on 10/11/24.
//

import UIKit

class TeenipingViewController: UIViewController {
    
    let teenipingView: TeenipingView = TeenipingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = teenipingView

    }
    
    private func setupAction() {
        teenipingView.segmentedControl.addTarget(
                self,
                action: #selector(segmentedControlValueChanged(segment:)),
                for: .valueChanged
            )
        }

    @objc
    private func segmentedControlValueChanged(segment: UISegmentedControl) {
       // TODO: segment 인덱스에 따라 collectionview 표시 여부 결정
    }


}

