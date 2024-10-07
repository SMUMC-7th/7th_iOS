//
//  SavedCell.swift
//  kream
//
//  Created by 유시은 on 10/6/24.
//

import UIKit

class SavedCell: UITableViewCell {
    
    static let identifier = "SavedCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setViews()
        self.setConstaints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // 파일 형식이 맞는지 체크
        self.savedImageView.image = nil
        self.savedName.text = nil
        self.savedDescription.text = nil
        self.savedPrice.text = nil
        //self.isSavedButton.image = nil
        self.isSavedButton.setImage(nil, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var savedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var savedName: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 12)
        
        return name
    }()
    
    private lazy var savedDescription: UILabel = {
        let description = UILabel()
        description.font = UIFont.systemFont(ofSize: 9)
        description.textColor = UIColor.lightGray
        
        return description
    }()
    
    private lazy var savedPrice: UILabel = {
        let price = UILabel()
        price.font = UIFont.systemFont(ofSize: 14)
        return price
    }()
    
    public lazy var isSavedButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private func setViews() {
        self.addSubview(savedImageView)
        self.addSubview(savedName)
        self.addSubview(savedDescription)
        self.addSubview(savedPrice)
        self.addSubview(isSavedButton)
    }
    
    private func setConstaints() {
        savedImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.bottom.equalToSuperview().offset(-14)
            $0.leading.equalToSuperview().offset(13)
            $0.width.height.equalTo(72)
        }
        
        savedName.snp.makeConstraints {
            $0.leading.equalTo(savedImageView.snp.trailing).offset(13)
            $0.top.equalTo(savedImageView.snp.top).offset(0)
        }
        
        savedDescription.snp.makeConstraints {
            $0.leading.equalTo(savedName.snp.leading).offset(0)
            //$0.trailing.equalToSuperview().offset(-142)
            // 자동으로 줄넘김되게 어떻게 하는지
            $0.top.equalTo(savedName.snp.bottom).offset(0)
        }
        
        isSavedButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-17)
            $0.top.equalToSuperview().offset(18)
            $0.width.equalTo(14)
            $0.height.equalTo(18)
        }
        
        savedPrice.snp.makeConstraints {
            $0.trailing.equalTo(isSavedButton.snp.trailing).offset(0)
            //$0.trailing.equalToSuperview().offset(16)
            $0.top.equalTo(isSavedButton.snp.bottom).offset(31)
        }
    }
    
    public func configure(model: SavedModel) {
        self.savedImageView.image = UIImage(named: model.savedImage)
        self.savedName.text = model.savedName
        self.savedDescription.text = model.savedDescription
        self.savedPrice.text = model.savedPrice
        self.isSavedButton.setImage(UIImage(named: model.isSavedButton), for: .normal)
    }
}

import SwiftUI
#Preview
{
    MainSavedViewController()
}
