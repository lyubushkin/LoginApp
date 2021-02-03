//
//  ViewController.swift
//  LoginApp
//
//  Created by Lyubushkin on 02.02.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var logInnButton: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as?
                WelcomeViewController else { return }
        guard let userName = userNameTextField.text else { return }
        
        destinationVC.userName = userName
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        
        userNameTextField.autocorrectionType = .no
        userNameTextField.spellCheckingType = .no
        
        userNameTextField.returnKeyType = UIReturnKeyType.next
        passwordTextField.returnKeyType = UIReturnKeyType.done
    }
    
    @IBAction func logInButtonPressed(_ sender: UIButton) {
        guard userNameTextField.text == "User" &&
                passwordTextField.text == "Password" else {
            
            inputValidation(sender)
            
            return
        }
        
        performSegue(withIdentifier: "welcomeSegue", sender: nil)
    }
    
    @IBAction func forgotButtonPressed(_ sender: UIButton) {
       inputValidation(sender)
    }
    
    @IBAction func unwindToLogInScreen(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindSegue" else { return }
        
        self.userNameTextField.text = nil
        self.passwordTextField.text = nil
    }
    
    private func inputValidation(_ button: UIButton) {
        var message = ""
        var title = "Oops!"
        
        switch button.tag {
        case 0:
            message = "You name is User 😉"
        case 1:
            message = "You password is Password 😉"
        case 2:
            message = "Please, enter correct login and password"
            title = "Invalid login or password"
            
            passwordTextField.text = nil
        default:
            break
        }
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК",
                                     style: .default,
                                     handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let nextTag = textField.tag + 1

        let nextResponder = textField.superview?.viewWithTag(nextTag)

            if nextResponder != nil {
                nextResponder?.becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
                performLoginAction()
            }
        
        return true
    }
    
    private func performLoginAction() {
        logInButtonPressed(logInnButton)
    }
}



