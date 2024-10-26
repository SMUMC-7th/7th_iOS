
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
        
        editView.imageEditCompletionHandler = { [weak self] newImage in
            self?.myProfileView.profileImage.image = newImage
        }
        
        editView.setProfileImage(image: myProfileView.profileImage.image!)
        navigationController?.pushViewController(editView, animated: true)
    }
    
    private func setProfileImage(image: UIImage) {
        myProfileView.profileImage.image = image
    }

}

import SwiftUI
#Preview {
    UINavigationController(rootViewController:  MyProfileViewController())
}
