//
//  ViewController.swift
//  LoginApp
//
//  Created by Lyubushkin on 02.02.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
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
    }
    
    @IBAction func logInButtonPressed() {
        guard userNameTextField.text == "User" &&
                passwordTextField.text == "Password" else { return }
        
        performSegue(withIdentifier: "welcomeSegue", sender: nil)
    }
    
    @IBAction func unwindToLogInScreen(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindSegue" else { return }
        
        self.userNameTextField.text = ""
        self.passwordTextField.text = ""
    }
    
}

