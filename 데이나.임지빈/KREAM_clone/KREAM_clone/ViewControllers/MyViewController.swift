import UIKit

class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myview
        myview.manageProfileButton.addTarget(self, action: #selector(ManageProfileViewButtonTap), for: .touchUpInside)
    }
    
    private var myview: MyView = {
        let view = MyView()
        return view
    }()
    
    private var profileImage: UIImage?
    
    @objc
    private func ManageProfileViewButtonTap() {
        let viewController = ManageProfileViewController()
        navigationController?.pushViewController(viewController, animated: true)
        // closure로 manageprofileviewcontroller 반환된값 이미지로 반환
        viewController.imageEditCompletionHandler = { [weak self] newImage in
            self?.myview.profileImage.image = newImage
        }
    }
}
