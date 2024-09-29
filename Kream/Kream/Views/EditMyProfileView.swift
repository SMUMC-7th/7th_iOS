//
//  EditMyProfileView.swift
//  Kream
//
//  Created by 이승준 on 9/29/24.
//

import UIKit
import SnapKit

class EditMyProfileView: UIView {
    
    var usernemail: String = ""
    var userpassword: String = ""
    
    private lazy var profileImage: UIImageView = {
        let imageVW = UIImageView()
        let profileImage = UIImage(named: "ProfileImage")
        imageVW.contentMode = .scaleAspectFit
        imageVW.image = profileImage
        return imageVW
    }()
    
    private lazy var maininfoView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필 정보"
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        return label
    }()
    
    private lazy var userEmailLabel: UILabel = {
        let label = UILabel()
        label.text = "유저 이메일"
        
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    private lazy var editConfirmButtonForEmail: UIButton = {
        let button = UIButton()
        button.setTitle("변경", for: .normal)
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
    
    func addComponents() {
        self.addSubview(profileImage)
        self.addSubview(maininfoView)
        maininfoView.addSubview(titleLabel)
        
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
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

import SwiftUI
#Preview{
    EditMyProfileViewController()
}
