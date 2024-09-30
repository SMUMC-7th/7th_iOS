import UIKit

class ManageProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = manageprofileview
        
        self.view.addSubview(navigationBar)
        let safeArea = self.view.safeAreaLayoutGuide
        
        navigationBar.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        navigationBar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        navigationBar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        navigationBar.barTintColor = .white //네비게이션 바 하양색으로
        navigationBar.shadowImage = UIImage() //네이게이션 바 선 없애기
        
        let navItem = UINavigationItem(title: "프로필 관리")
        let font = UIFont.systemFont(ofSize: 16, weight: .medium)
        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: font    // 폰트 적용
        ]
        
        let leftButton = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(tapDismissButton))
        leftButton.tintColor = .black
        
        navItem.leftBarButtonItem = leftButton
        navigationBar.setItems([navItem], animated: true)
        
    }
    
    private var manageprofileview: ManageProfileViewBefore = {
        let view = ManageProfileViewBefore()
        return view
        
    }()
    
    let navigationBar : UINavigationBar = {
        let navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        return navigationBar
    }()
    
    @objc func tapDismissButton() {
        let viewController = MyViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
        }
    
}
