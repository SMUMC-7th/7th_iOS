//
//  JustDroppedCollectionViewCell.swift
//  Kream
//
//  Created by 이승준 on 11/4/24.
//

import UIKit

class JustDroppedCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "JustDroppedIdentifier"
    
    private lazy var productImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 12
        return image
    }()
    
    private lazy var tradedCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    private lazy var bookmarkButton: UIButton = {
        let button = UIButton()
        //button.setImage(UIImage(named: "bookmark.icon2"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    private lazy var productBrandLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .bold)
        return label
    }()
    
    private lazy var imediatePriceLabel: UILabel = {
        let label = UILabel()
        label.text = "즉시 구매가"
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.textColor = .loginTextField
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents() {
        self.addSubview(productImageView)
        self.addSubview(tradedCountLabel)
        self.addSubview(bookmarkButton)
        self.addSubview(productBrandLabel)
        self.addSubview(productNameLabel)
        self.addSubview(priceLabel)
        self.addSubview(imediatePriceLabel)
        
        self.snp.makeConstraints { make in
            make.height.equalTo(237)
            make.width.equalTo(142)
        }
        
        productImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.trailing.equalToSuperview()
            make.height.width.equalTo(142)
        }
        
        tradedCountLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(15)
        }
        
        bookmarkButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-5)
            make.bottom.equalToSuperview().offset(-115)
            make.height.equalTo(15)
        }
        
        productBrandLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(20)
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.top.equalTo(productBrandLabel.snp.bottom).offset(3)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.bottom.equalTo(imediatePriceLabel.snp.top).offset(-2)
            make.leading.equalToSuperview().offset(20)
        }
        
        imediatePriceLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    func configuration(data: Product) {
        self.productImageView.image = data.image
        self.productNameLabel.text = data.name
        self.productBrandLabel.text = data.desription
        self.priceLabel.text = setPriceLabel(price : data.price)
        self.tradedCountLabel.text = data.traded
        self.bookmarkButton.setImage(data.bookmarked ? UIImage(named: "bookmarkSelected.icon2") : UIImage(named: "bookmarkNonselected.icon2"), for: .normal)
    }
    
    private func setPriceLabel(price row: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let formattedNumber = numberFormatter.string(from: NSNumber(value: row)) else {
            return "??? 원"
        }
        return formattedNumber + "원"
    }
            
}

import SwiftUI

#Preview{
    TempViewController()
}
