//
//  SavedTableViewCell.swift
//  Kream
//
//  Created by 이승준 on 10/6/24.
//

import UIKit

class SavedTableViewCell: UITableViewCell {
    
    static let identifier = "SavedCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setViews()
        self.setComponents()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private lazy var containerView: UIView = {
        let container = UIView()
        container.backgroundColor = .gray
        return container
    }()

    private func setViews() {
        self.addSubview(containerView)
        
        
    }
    
    private func setComponents() {
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    public func configure(product: Product) {
        
    }
    
}

import SwiftUI
#Preview {
    SavedViewController()
}
