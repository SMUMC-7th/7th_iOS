//
//  ProfileManagementView.swift
//  kream
//
//  Created by 유시은 on 10/1/24.
//

import UIKit

class ProfileManagementView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var profileImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "profileImage")
        image.contentMode = .scaleAspectFit // 중요함 나중에 공부하기
        
        return image
    }()
    
    private lazy var profileInformationLable : UILabel = {
        let label = UILabel()
        label.text = "프로필 정보"
        label.font = UIFont.systemFont(ofSize: 21, weight: .bold)
        
        return label
    }()
    
    private lazy var userEmailLabel : UILabel = {
        let label = UILabel()
        label.text = "유저 이메일"
        //label.font = UIFont.sy
        
        return label
    }()
    
    private lazy var userEmailEnterTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "   새로운 이메일을 입력해주세요!"
        //textField.placeholder.
        
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        
        textField.layer.cornerRadius = 10
        
        return textField
    }()
    
    private lazy var userPasswordLabel : UILabel = {
        let label = UILabel()
        label.text = "유저 비밀번호"
        //label.font = UIFont.sy
        
        return label
    }()
    
    private lazy var userPasswordEnterTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "   새로운 비밀번호를 입력해주세요!"
        //textField.placeholder.
        
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        
        textField.layer.cornerRadius = 10
        
        return textField
    }()
    
    private lazy var userEmailChangeButton : UIButton = {
        let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    private lazy var userPasswordChangeButton : UIButton = {
        let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    
    
    private func addComponents() {
        self.addSubview(profileImage)
        self.addSubview(profileInformationLable)
        self.addSubview(userEmailLabel)
        self.addSubview(userEmailEnterTextField)
        self.addSubview(userEmailChangeButton)
        self.addSubview(userPasswordLabel)
        self.addSubview(userPasswordEnterTextField)
        self.addSubview(userPasswordChangeButton)
        
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(144)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(90)
            $0.height.equalTo(90)
        }
        
        profileInformationLable.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(27)
        }
        
        userEmailLabel.snp.makeConstraints {
            $0.top.equalTo(profileInformationLable.snp.bottom).offset(23)
            $0.leading.equalTo(profileInformationLable.snp.leading).offset(0)
        }
        
        userEmailEnterTextField.snp.makeConstraints {
            $0.top.equalTo(userEmailLabel.snp.bottom).offset(4)
            $0.leading.equalTo(profileInformationLable.snp.leading).offset(0)
            $0.width.equalTo(282)
            $0.height.equalTo(32)
        }
        
        userEmailChangeButton.snp.makeConstraints {
            $0.top.equalTo(userEmailEnterTextField.snp.top).offset(0)
            $0.leading.equalTo(userEmailEnterTextField.snp.trailing).offset(9)
            $0.width.equalTo(58)
            $0.height.equalTo(32)
        }
        
        userPasswordLabel.snp.makeConstraints {
            $0.top.equalTo(userEmailEnterTextField.snp.bottom).offset(23)
            $0.leading.equalTo(profileInformationLable.snp.leading).offset(0)
        }
        
        userPasswordEnterTextField.snp.makeConstraints {
            $0.top.equalTo(userPasswordLabel.snp.bottom).offset(4)
            $0.leading.equalTo(profileInformationLable.snp.leading).offset(0)
            $0.width.equalTo(282)
            $0.height.equalTo(32)
        }
        
        userPasswordChangeButton.snp.makeConstraints {
            $0.top.equalTo(userPasswordEnterTextField.snp.top).offset(0)
            $0.leading.equalTo(userPasswordEnterTextField.snp.trailing).offset(9)
            $0.width.equalTo(58)
            $0.height.equalTo(32)
        }
        
    }

}


import SwiftUI
#Preview
{
    ProfileManagementViewController()
}
