//
//  ViewController.swift
//  UMC CollectionView
//
//  Created by 이승준 on 10/11/24.
//

import UIKit

class TeenipingViewController: UIViewController, UICollectionViewDelegate {
    
    let teenipingView: TeenipingView = TeenipingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = teenipingView
        
        setupAction()
        setupDelegate()
    }
    
    private func setupAction() {
        teenipingView.segmentedControl.addTarget(
            self,
            action: #selector(segmentedControlValueChanged(segment:)),
            for: .valueChanged
        )
    }
    
    private func setupDelegate() {
        teenipingView.teenipingCollectionView.delegate = self
        teenipingView.teenipingCollectionView.dataSource = self
    }

    @objc
    private func segmentedControlValueChanged(segment: UISegmentedControl) {
            if segment.selectedSegmentIndex == 0 {
                teenipingView.teenipingCollectionView.isHidden = false
                teenipingView.emptyLabel.isHidden = true
            }
            else {
                teenipingView.teenipingCollectionView.isHidden = true
                teenipingView.emptyLabel.isHidden = false
            }
        }

}

extension TeenipingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TeenipingModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell( withReuseIdentifier: TeenipingCollectionViewCell.identifier, for: indexPath) as? TeenipingCollectionViewCell
            else {
                return UICollectionViewCell()
            }
        
        let data = TeenipingModel.dummy()[indexPath.row]
        cell.configuration(data: data)
        return cell
    }
    
}
