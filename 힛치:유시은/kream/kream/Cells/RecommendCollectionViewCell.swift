//
//  MainRecommendCollectionViewCell.swift
//  kream
//
//  Created by 유시은 on 10/25/24.
//

import UIKit

class RecommendCollectionViewCell: UICollectionViewCell {
    // MainHomeView 안에 recommendCollectionView 식별자
    static let identifier = "RecommendCollectionViewCell"
    
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }
    
    let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 11.5, weight: .light)
        $0.textColor = .black
        $0.text = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(imageView)
        addSubview(titleLabel)
        
        imageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.width.equalTo(61)
        }
        
        titleLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.top.equalTo(imageView.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
        }
    }

}
