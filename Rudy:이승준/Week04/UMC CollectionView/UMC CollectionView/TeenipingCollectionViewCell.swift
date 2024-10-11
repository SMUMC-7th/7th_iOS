//
//  TeenipingCollectionViewCell.swift
//  UMC CollectionView
//
//  Created by 이승준 on 10/11/24.
//

import UIKit

class TeenipingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TeenipingCollectionViewCell"
    
    let imageView = UIImageView().then { image in
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
    }
    
    let titleLabel = UILabel().then {label in
        label.font = .systemFont(ofSize: 10, weight: .semibold)
        label.textColor = .black
        label.text = "티니핑"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        
        imageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(120)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(4)
        }
    }
    
    public func configuration(data: TeenipingModel) {
        imageView.image = data.image
        titleLabel.text = data.name
    }
    
    
}
