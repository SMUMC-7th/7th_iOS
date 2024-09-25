import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginview
    }

    private var loginview: LoginView = {
        let view = LoginView()
        return view
    }()
}

