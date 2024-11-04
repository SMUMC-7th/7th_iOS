//
//  ChallengeCollectionViewCell.swift
//  Kream
//
//  Created by 이승준 on 11/4/24.
//

import UIKit

class ChallengeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ChallengeIdentifier"
    
    private lazy var userIDLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .white
        return label
    }()
    
    private lazy var userPhoto: UIImageView = {
        let photo = UIImageView()
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 8
        photo.contentMode = .scaleAspectFill
        return photo
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    private func addComponents() {
        self.addSubview(userPhoto)
        self.addSubview(userIDLabel)
        
        self.snp.makeConstraints { make in
            make.height.equalTo(165)
            make.width.equalTo(124)
        }
        
        userPhoto.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(165)
            make.width.equalTo(124)
        }
        
        userIDLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-11)
        }
        
    }
    
    func configuration(data: Challenge) {
        userIDLabel.text = data.userid
        userPhoto.image = data.userPhoto
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
