
import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    
    var userName : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = "Welcome, \(userName ?? "")!"
    }
}
