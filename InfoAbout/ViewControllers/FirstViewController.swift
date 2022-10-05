

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var userNameTF: UITextField!
    
    private let user = "User"
    private let password = "Password"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? HomeViewController else { return }
        destinationVC.userName = userNameTF.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTF.text = password
        userNameTF.text = user
    }

    @IBAction func logInButtonTapped() {
        guard let userName = userNameTF.text, let password = passwordTF.text else { return }
        
        if userName != "User" || password != "Password" {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTF
            )
        }
        performSegue(withIdentifier: "logIn", sender: nil)
    }
    
    @IBAction func forgotData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", message: "Your name is \(user) 😱")
        : showAlert(title: "Oops!", message: "Your password is \(password) 😱")
    }
    
    @IBAction func unwindSegueToFirstVC(segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
}

extension FirstViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

