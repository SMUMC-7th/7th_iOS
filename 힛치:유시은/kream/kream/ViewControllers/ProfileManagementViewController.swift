//
//  ProfileManagementViewController.swift
//  kream
//
//  Created by 유시은 on 10/1/24.
//

import UIKit
 
class ProfileManagementViewController: UIViewController {
    
    private let loginUserDefaultsModel = LoginUserDefaultsModel()
    
    // 옵셔널 사용 위해서 ? 붙여줌(초기화하기 애매할때)
    var userId: String?
    var userPassword: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = profilemanagementview
        setUpNavigationBar()
        
        loadIdValue()
        loadPasswordValue()
        
        profilemanagementview.userEmailEnterTextField.isUserInteractionEnabled = false
        profilemanagementview.userPasswordEnterTextField.isUserInteractionEnabled = false
        
        profilemanagementview.userEmailChangeButton.addTarget(self, action: #selector(emailChangeButtonDidTap), for: .touchUpInside)
        profilemanagementview.userPasswordChangeButton.addTarget(self, action: #selector(passwordChangeButtonDidTap), for: .touchUpInside)
    }
    
    public func loadIdValue() {
        if let savedId = loginUserDefaultsModel.loadUserId() {
            profilemanagementview.userEmailEnterTextField.text = savedId
        }
    }
    
    public func loadPasswordValue() {
        if let savedPassword = loginUserDefaultsModel.loadUserPassword() {
            profilemanagementview.userPasswordEnterTextField.text = savedPassword
        }
    }
    
    public lazy var profilemanagementview : ProfileManagementView = {
        let profilemanagement = ProfileManagementView()
        return profilemanagement
    }()
    
    public func setUpNavigationBar() {
        let backButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .done, target: self, action: #selector(backButtonDidTap))
        backButtonItem.tintColor = .black
        self.navigationItem.hidesBackButton = true 
        self.navigationItem.leftBarButtonItem = backButtonItem
    }
    
    @objc
    private func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func emailChangeButtonDidTap() {
        // 변경 -> 확인
        if profilemanagementview.userEmailChangeButton.title(for: .normal) == "변경" {
            profilemanagementview.userEmailChangeButton.setTitle("확인", for: .normal)
            profilemanagementview.userEmailEnterTextField.isUserInteractionEnabled = true
            profilemanagementview.userEmailEnterTextField.text = nil
        }
        // 확인 -> 변경
        else if profilemanagementview.userEmailChangeButton.title(for: .normal) == "확인" {
            if let newEmail = profilemanagementview.userEmailEnterTextField.text, !newEmail.isEmpty {
                loginUserDefaultsModel.saveUserId(newEmail)
                profilemanagementview.userEmailChangeButton.setTitle("변경", for: .normal)
                profilemanagementview.userEmailEnterTextField.isUserInteractionEnabled = false
            }
        }
    }
    
    @objc
    private func passwordChangeButtonDidTap() {
        if profilemanagementview.userPasswordChangeButton.title(for: .normal) == "변경" {
            profilemanagementview.userPasswordChangeButton.setTitle("확인", for: .normal)
            profilemanagementview.userPasswordEnterTextField.isUserInteractionEnabled = true
            profilemanagementview.userPasswordEnterTextField.text = nil
        }
        else if profilemanagementview.userPasswordChangeButton.title(for: .normal) == "확인" {
            if let newPassword = profilemanagementview.userPasswordEnterTextField.text, !newPassword.isEmpty {
                loginUserDefaultsModel.saveUserPassword(newPassword)
                profilemanagementview.userPasswordChangeButton.setTitle("변경", for: .normal)
                profilemanagementview.userPasswordEnterTextField.isUserInteractionEnabled = false
            }
        }
    }
}

import SwiftUI
#Preview
{
    //ProfileManagementViewController()
    MainViewController()
}

