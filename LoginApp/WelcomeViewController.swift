//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Lyubushkin on 02.02.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeNameLabel: UILabel!
    
    var userName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let userName = userName else { return }
        
        welcomeNameLabel.text = "Welcome, \(userName)!"
        
    }
}
