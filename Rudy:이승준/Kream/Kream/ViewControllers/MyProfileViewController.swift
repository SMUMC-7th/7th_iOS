
import UIKit
import SnapKit

class MyProfileViewController: UIViewController {
    
    private lazy var myProfileView = MyProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myProfileView
        myProfileView.editProfileButton.addTarget(self, action: #selector(pushEditProfileView), for: .touchUpInside)
        self.navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    @objc
    private func pushEditProfileView() {
        let editView = EditMyProfileViewController()
        editView.setProfileImage(image: myProfileView.profileImage.image!)
        navigationController?.pushViewController(editView, animated: true)
    }

}

import SwiftUI
#Preview {
    UINavigationController(rootViewController:  MyProfileViewController())
}
