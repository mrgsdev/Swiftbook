import UIKit

class Safe {
    
    var money = 0
    static let shared = Safe()
    
    private init() {}
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let safe = Safe.shared
        print(safe.money)
        
    }
}
