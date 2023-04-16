//
//  User.swift
//  Bookstore
//
//  Created by Nurikk T. on 17.04.2023.
//

import Foundation

struct User {
    var uid: String = ""
    let login: String?
    let password: String?
}
extension User {
    static var login = [
        User(login: "admin", password: "admin")
    ]
}
