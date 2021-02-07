//
//  AboutMeViewController.swift
//  LoginApp
//
//  Created by Aleksey Lyubushkin on 07.02.2021.
//

import UIKit

class AboutMeViewController: UIViewController {
    @IBOutlet var userHobbyLabel: UILabel!
    @IBOutlet var userJobLabel: UILabel!
    
    @IBOutlet var avatarImage: UIImageView!
    
    var userHobby: String!
    var userJob: String!
    var fullName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userHobbyLabel.text = "I like " + userHobby
        userJobLabel.text = "Place of work is " + userJob
        
        title = fullName
        
        avatarImage.image =
            UIImage(named: User.getInfoAboutUser().userInfo.avatar)
        avatarImage.layer.cornerRadius = avatarImage.frame.size.width / 2
        avatarImage.clipsToBounds = true
        avatarImage.layer.borderWidth = 2
        avatarImage.layer.borderColor = .init(red: 0.5,
                                              green: 0.5,
                                              blue: 0.5,
                                              alpha: 1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let navigationController = segue.destination as? UserSettingsViewController
        else { return }

        navigationController.settingsTitle = "Настройка профиля"
        
    }
}
