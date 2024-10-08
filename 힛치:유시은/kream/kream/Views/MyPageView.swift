//
//  MyPageView.swift
//  kream
//
//  Created by 유시은 on 10/1/24.
//

import UIKit

class MyPageView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var settingButton : UIButton = {
        let button = UIButton()
        let image = UIImage(named: "setting")

        button.setImage(image, for: .normal)
        
        return button
    }()
    
    private lazy var cameraButton : UIButton = {
        let button = UIButton()
        let image = UIImage(named: "camera")
        
        button.setImage(image, for: .normal)
        
        return button
    }()
    
    private lazy var profileImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "profileImage")
        image.contentMode = .scaleAspectFit // 중요함 나중에 공부하기
        
        return image
    }()
    
    private lazy var profileName : UILabel = {
        let label = UILabel()
        label.text = "Hitch_iOS"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        return label
    }()
    
    private lazy var profileFollower : UILabel = {
        let label = UILabel()
        label.text = "팔로워 1M"
        label.font = UIFont.systemFont(ofSize: 13)
        
        return label
    }()
    
    private lazy var profileFollowing : UILabel = {
        let label = UILabel()
        label.text = "팔로잉 100"
        label.font = UIFont.systemFont(ofSize: 13)
        
        return label
    }()
    
    public lazy var manageProfileButton : UIButton = {
        let button = UIButton()
        
        button.setTitle("프로필 관리", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0).cgColor
        
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        
        return button
    }()
    
    private lazy var shareProfileButton : UIButton = {
        let button = UIButton()
        
        button.setTitle("프로필 공유", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0).cgColor
        
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        
        return button
    }()
    
    private func addComponents() {
        self.addSubview(settingButton)
        self.addSubview(cameraButton)
        self.addSubview(profileImage)
        self.addSubview(profileName)
        self.addSubview(profileFollower)
        self.addSubview(profileFollowing)
        self.addSubview(manageProfileButton)
        self.addSubview(shareProfileButton)
        
        settingButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(75)
            $0.leading.equalToSuperview().offset(32.5)
            $0.width.equalTo(25) // 가로 길이
            $0.height.equalTo(25)
        }
        
        cameraButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(75)
            $0.trailing.equalToSuperview().offset(-32.5)
            // - 붙여야함
            $0.width.equalTo(25) // 가로 길이
            $0.height.equalTo(25)
        }
        
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(126)
            $0.leading.equalToSuperview().offset(32.5)
            $0.width.equalTo(90)
            $0.height.equalTo(90)
        }
        
        profileName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(147)
            $0.leading.equalToSuperview().offset(138.5)
            
        }
        
        profileFollower.snp.makeConstraints {
            $0.top.equalTo(profileName.snp.bottom).offset(6)
            $0.leading.equalTo(profileName.snp.leading).offset(0)
        }
        
        profileFollowing.snp.makeConstraints {
            $0.top.equalTo(profileName.snp.bottom).offset(6)
            $0.leading.equalTo(profileFollower.snp.trailing).offset(8)
        }
        
        manageProfileButton.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(26)
            $0.leading.equalToSuperview().offset(32.5)
            $0.width.lessThanOrEqualTo(157)
            $0.height.equalTo(26)
            $0.trailing.equalTo(shareProfileButton.snp.leading).offset(-14)
        }
        
        shareProfileButton.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(26)
            $0.leading.equalTo(manageProfileButton.snp.trailing).offset(14)
            $0.trailing.equalToSuperview().offset(-32.5)
            $0.width.equalTo(manageProfileButton)
            $0.height.equalTo(26)
        }
    }

}

import SwiftUI
#Preview
{
    MainMyViewController()
}
