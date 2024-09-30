import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginview
        
        loginview.loginButton.addTarget(self, action: #selector(LoginToMyPage), for: .touchUpInside)
    }

    private var loginview: LoginView = {
        let view = LoginView()
        return view
    }()
    
    
    @objc
    private func LoginToMyPage() {
        let viewController = MyViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true) 
    }
}

