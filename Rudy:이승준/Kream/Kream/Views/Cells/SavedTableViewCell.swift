//
//  SavedTableViewCell.swift
//  Kream
//
//  Created by 이승준 on 10/6/24.
//

import UIKit
import SnapKit

class SavedTableViewCell: UITableViewCell {
    
    static let identifier = "SavedCell"
    
    //MARK: - UI Components
    private lazy var productImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var productName: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setViews()
        self.setComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Set Components
    private func setViews() {
        self.addSubview(productImage)
        self.addSubview(productName)
    }
    
    private func setComponents() {
        productImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(72)
        }
        
        productName.snp.makeConstraints { make in
            make.top.equalToSuperview()
        }
    }
    
    public func configure(with product: Product) {
        print("name of product is \(product.name)")
        productImage.image = product.image
        productName.text = product.name
    }
    
}

import SwiftUI
#Preview {
    SavedViewController()
}
