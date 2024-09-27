import UIKit

class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myview
    }
    
    private var myview: MyView = {
        let view = MyView()
        return view
        
    }()
}
