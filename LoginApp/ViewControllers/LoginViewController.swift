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
    
    private let user = User.getInfoAboutUser()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        
        userNameTextField.autocorrectionType = .no
        userNameTextField.spellCheckingType = .no
        
        userNameTextField.returnKeyType = UIReturnKeyType.next
        passwordTextField.returnKeyType = UIReturnKeyType.done
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let tabBarController = segue.destination as? UITabBarController
        else { return }
        
        guard
            let tabBarControllers = tabBarController.viewControllers
        else { return }
        
        for viewController in tabBarControllers {
            
            if let welcomeVC = viewController as? WelcomeViewController {
                
                welcomeVC.userName = user.userInfo.fullName
                
            } else if let
                        navigationVC = viewController as? UINavigationController {
                if let
                    aboutUserVC = navigationVC.topViewController as? AboutMeViewController {
                    
                    aboutUserVC.userHobby = user.userInfo.hobby
                    aboutUserVC.userJob = user.userInfo.job
                    aboutUserVC.fullName = user.userInfo.fullName
                    aboutUserVC.userAvatar = user.userInfo.avatar
                    
                }
            }
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func logInButtonPressed(_ sender: UIButton) {
        guard checkLoginPassword() else { inputValidation(sender)
            return }
        
        performSegue(withIdentifier: "welcomeSegue", sender: nil)
    }
    
    @IBAction func forgotButtonPressed(_ sender: UIButton) {
       inputValidation(sender)
    }
    
    @IBAction func unwindToLogInScreen(segue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
    
    private func checkLoginPassword() -> Bool {
        if userNameTextField.text == user.userName &&
            passwordTextField.text == user.password { return true }

        return false
    }
    
    private func inputValidation(_ button: UIButton) {
        var message = ""
        var title = "Oops!"
        
        switch button.tag {
        case 0:
            message = "You name is \(user.userName) 😉"
        case 1:
            message = "You password is \(user.password) 😉"
        case 2:
            message = "Please, enter correct login and password"
            title = "Invalid login or password"
            
            passwordTextField.text = nil
            passwordTextField.becomeFirstResponder()
            
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
    
    private func performLoginAction() {
        logInButtonPressed(logInnButton)
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
}



