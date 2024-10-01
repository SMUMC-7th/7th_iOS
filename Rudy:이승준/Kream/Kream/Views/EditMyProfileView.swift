//
//  EditMyProfileView.swift
//  Kream
//
//  Created by 이승준 on 9/29/24.
//

import UIKit
import SnapKit

class EditMyProfileView: UIView {
    
    var isEmailEditing = true
    var ispasswordEditing = true
    
    public lazy var profileImage: UIImageView = {
        let imageVW = UIImageView()
        let profileImage = UIImage(named: "ProfileImage")
        imageVW.contentMode = .scaleAspectFit
        imageVW.image = profileImage
        return imageVW
    }()
    
    public lazy var maininfoView: UIView = {
        let view = UIView()
        //view.backgroundColor = .gray
        return view
    }()
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필 정보"
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        return label
    }()
    
    public lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "유저 이메일"
        
        return label
    }()
    
    public lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.text = "rofxnaos@gmail.com"
        textField.placeholder = "새로운 이메일을 입력해주세요!"
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor(named: "LoginTextField")?.cgColor
        textField.font = .systemFont(ofSize: 13)
        textField.layer.borderWidth = 1
        
        let paddingView = UIView(frame: CGRect(x: 0, y: -20, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    public lazy var emailEditButton: UIButton = {
        let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(.black).cgColor
        return button
    }()
    
    public lazy var pwdLabel: UILabel = {
        let label = UILabel()
        label.text = "유저 비밀번호"
        
        return label
    }()
    
    public lazy var pwdTextField: UITextField = {
        let textField = UITextField()
        textField.text = "rofxnaos@gmail.com"
        textField.placeholder = "새로운 비밀번호를 입력해주세요!"
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor(named: "LoginTextField")?.cgColor
        textField.font = .systemFont(ofSize: 13)
        textField.layer.borderWidth = 1
        
        let paddingView = UIView(frame: CGRect(x: 0, y: -20, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    public lazy var pwdEditButton: UIButton = {
        let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(.black).cgColor
        return button
    }()

    
    init (frame: CGRect, usernemail: String, userpassword: String) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    private func addComponents() {
        self.addSubview(profileImage)
        self.addSubview(maininfoView)
        maininfoView.addSubview(titleLabel)
        
        maininfoView.addSubview(emailLabel)
        maininfoView.addSubview(emailTextField)
        maininfoView.addSubview(emailEditButton)
        
        maininfoView.addSubview(pwdLabel)
        maininfoView.addSubview(pwdTextField)
        maininfoView.addSubview(pwdEditButton)

        
        profileImage.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(120)
            $0.height.equalTo(90)
            $0.width.equalTo(90)
        }
        
        maininfoView.snp.makeConstraints{
            $0.top.equalTo(profileImage.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(250)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        emailLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints{
            $0.top.equalTo(emailLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(emailEditButton.snp.leading).offset(-30)
            $0.height.equalTo(30)
        }
        
        emailEditButton.snp.makeConstraints{
            $0.top.equalTo(emailLabel.snp.bottom).offset(10)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(58)
            $0.height.equalTo(30)
        }
        
        pwdLabel.snp.makeConstraints{
            $0.top.equalTo(emailEditButton.snp.bottom).offset(30)
            $0.leading.equalToSuperview()
        }
        
        pwdTextField.snp.makeConstraints{
            $0.top.equalTo(pwdLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(pwdEditButton.snp.leading).offset(-30)
            $0.height.equalTo(30)
        }
        
        pwdEditButton.snp.makeConstraints{
            $0.top.equalTo(pwdLabel.snp.bottom).offset(10)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(58)
            $0.height.equalTo(30)
        }
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

import SwiftUI
#Preview{
    EditMyProfileViewController()
}
