

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var userNameTF: UITextField!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? WelcomeViewController else { return }
        destinationVC.userName = userNameTF.text
    }

    @IBAction func logInButtonTapped() {
        guard let userName = userNameTF.text, let password = passwordTF.text else { return }
        
        if userName != "User" || password != "Password" {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password"
            )
            passwordTF.text = ""
        }
        
        performSegue(withIdentifier: "logIn", sender: nil)
    }
    
    @IBAction func passwordButtonTapped() {
        showAlert(
            title: "Oops!",
            message: "Your password is Password 😱"
        )
    }
    
    @IBAction func userNameButtonTapped() {
        showAlert(
            title: "Oops!",
            message: "Your username is User 😱"
        )
    }
    
    @IBAction func unwindSegueToFirstVC(segue: UIStoryboardSegue) {
        
        userNameTF.text = ""
        passwordTF.text = ""
    }
}

extension FirstViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension FirstViewController: UITextViewDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

