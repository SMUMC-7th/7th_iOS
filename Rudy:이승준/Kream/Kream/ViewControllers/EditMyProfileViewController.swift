//
//  EditMyProfileViewController.swift
//  Kream
//
//  Created by 이승준 on 9/29/24.
//

import UIKit

class EditMyProfileViewController: UIViewController {
    
    let userDefaults = UserDefaults.standard
    
    var usernemail: String = ""
    var userpassword: String = ""
    
    private lazy var editView: EditMyProfileView = {
        let view = EditMyProfileView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadUserDefaults()
        self.view = editView
        editView.emailEditButton.addTarget(self, action: #selector(editingEmailToggle), for: .touchUpInside)
        editView.pwdEditButton.addTarget(self, action: #selector(editingPwdToggle), for: .touchUpInside)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.navigationItem.hidesBackButton = true
        
        let backImage = UIImage(systemName: "arrow.backward")?.withTintColor(.black)
        let customBackButton = UIBarButtonItem(image: backImage, style: .plain, target: self, action:  #selector(customBackAction))
        
        self.navigationItem.leftBarButtonItem = customBackButton
        self.navigationItem.title = "프로필 관리"
    }
    
    private func loadUserDefaults() {
        guard let email = userDefaults.string(forKey: "user_email"),
              let pwd = userDefaults.string(forKey: "user_pwd") else {
            print("There is no Value for user_email, user_pwd")
            return
        }
        editView.emailTextField.text = email
        editView.pwdTextField.text = pwd
    }
    
    @objc
    private func customBackAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func editingEmailToggle() {
        editView.emailTextField.isUserInteractionEnabled.toggle()
        let enable = editView.emailTextField.isUserInteractionEnabled
        
        if enable { //
            editView.emailTextField.text = nil
            editView.emailEditButton.setTitle("확인", for: .normal)
        } else { //
            userDefaults.set(editView.emailTextField.text, forKey: "user_email")
            editView.emailEditButton.setTitle("변경", for: .normal)
        }
    }
    
    @objc
    private func editingPwdToggle() {
        editView.pwdTextField.isUserInteractionEnabled.toggle()
        let enable = editView.pwdTextField.isUserInteractionEnabled
        
        if enable {
            editView.pwdTextField.text = nil
            editView.pwdEditButton.setTitle("확인", for: .normal)
        } else {
            userDefaults.set(editView.pwdTextField.text, forKey: "user_pwd")
            editView.pwdEditButton.setTitle("변경", for: .normal)
        }
    }
    
    public func setProfileImage(image : UIImage) {
        editView.profileImage.image = image
    }
}
