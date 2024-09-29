//
//  EditMyProfileViewController.swift
//  Kream
//
//  Created by 이승준 on 9/29/24.
//

import UIKit

class EditMyProfileViewController: UIViewController {
    
    var usernemail: String = ""
    var userpassword: String = ""
    
    private lazy var editView: EditMyProfileView = {
        let view = EditMyProfileView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = editView
        editView.emailEditButton.addTarget(self, action: #selector(editingEmailDone), for: .touchUpInside)
        editView.pwdEditButton.addTarget(self, action: #selector(editingPwdDone), for: .touchUpInside)
    }
    
    @objc
    private func editingEmailDone() {
        if editView.isEmailEditing {
            editView.emailTextField.text = nil
            editView.emailEditButton.setTitle("확인", for: .normal)
            editView.isEmailEditing = false
        }
    }
    
    @objc
    private func editingPwdDone() {
        if editView.ispasswordEditing {
            editView.pwdTextField.text = nil
            editView.pwdEditButton.setTitle("확인", for: .normal)
            editView.ispasswordEditing = false
        }
    }
}
