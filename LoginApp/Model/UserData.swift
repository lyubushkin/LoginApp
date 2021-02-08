//
//  UserData.swift
//  LoginApp
//
//  Created by Aleksey Lyubushkin on 06.02.2021.
//

import Foundation

struct User {
    let userName: String
    let password: String
    let userInfo: Person
}

struct Person {
    let name: String
    let sureName: String
    var fullName: String {
        name + " " + sureName
    }
    
    let hobby: String
    let job: String
    
    let avatar: String
}

extension User {
    static func getInfoAboutUser() -> User {
        User(userName: "User",
            password: "Password",
            userInfo: Person(name: "Aleksey",
                             sureName: "Lyubushkin",
                             hobby: "fishing",
                             job: "Autoportal Ferio",
                             avatar: "lyubushkin"))
    }
}

