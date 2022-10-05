

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet var name: UILabel!
    @IBOutlet var surname: UILabel!
    @IBOutlet var placeOfBirth: UILabel!
    @IBOutlet var yearOfBirth: UILabel!
    
    @IBOutlet var photo: UIImageView!
    
    private let information = User.getInfoAbout()
    
    private let primaryColor = UIColor(
        red: 210/255,
        green: 109/255,
        blue: 128/255,
        alpha: 1
    )
    private let secondaryColor = UIColor(
        red: 107/255,
        green: 148/255,
        blue: 230/255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        name.text = information.name
        surname.text = information.surname
        placeOfBirth.text = information.placeOfBirth
        yearOfBirth.text = information.yearOfBirth
    }
    
    override func viewWillLayoutSubviews() {
        photo.layer.cornerRadius = photo.frame.width / 2
    }
    
}

extension UIView {
    func addSecondVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}

