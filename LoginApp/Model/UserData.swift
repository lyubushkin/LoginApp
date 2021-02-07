//
//  UserData.swift
//  LoginApp
//
//  Created by Aleksey Lyubushkin on 06.02.2021.
//

import Foundation

struct Pass {
    let login: String
    let password: String
}

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

extension Pass {
    static func getLogin() -> String {
        "User"
    }
    
    static func getPassword() -> String {
        "Password"
    }
}

extension User {
    static func getInfoAboutUser() -> User {
        let user = User(userName: "User",
                        password: "Pssword",
                        userInfo: Person(name: "Aleksey",
                                         sureName: "Lyubushkin",
                                         hobby: "fishing",
                                         job: "Autoportal Ferio",
                                         avatar: "lyubushkin"))
        return user
    }
}

