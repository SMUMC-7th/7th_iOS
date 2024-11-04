//
//  TempViewController.swift
//  Kream
//
//  Created by 이승준 on 11/4/24.
//

import UIKit

class TempViewController: UIViewController, UICollectionViewDelegate {
    
    public lazy var justDroppedCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 142, height: 237)
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .horizontal
        
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.backgroundColor = .clear
        collectionview.isScrollEnabled = true
        collectionview.register(JustDroppedCollectionViewCell.self, forCellWithReuseIdentifier: JustDroppedCollectionViewCell.identifier)
        return collectionview
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDelegate()
        addComponents()
        // Do any additional setup after loading the view.
    }
    
    private func setUpDelegate() {
        justDroppedCollectionView.delegate = self
        justDroppedCollectionView.dataSource = self
    }
    
    private func addComponents() {
        self.view.addSubview(justDroppedCollectionView)
        
        justDroppedCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(237)

        }
    }


}

extension TempViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SavedProducts.just.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: JustDroppedCollectionViewCell.identifier, for: indexPath) as? JustDroppedCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            let data = SavedProducts.just[indexPath.row]
            cell.configuration(data: data)
            return cell
    }
}

import SwiftUI

#Preview{
    TempViewController()
}
