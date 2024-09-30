import UIKit

class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myview
        
        myview.manageProfileButton.addTarget(self, action: #selector(MyPageToManageProfile), for: .touchUpInside)
    }
    
    private var myview: MyView = {
        let view = MyView()
        return view
        
    }()
    
    @objc
    private func MyPageToManageProfile() {
        let viewController = ManageProfileViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
}
