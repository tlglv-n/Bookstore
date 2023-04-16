//
//  ViewModel.swift
//  Bookstore
//
//  Created by Nurikk T. on 13.04.2023.
//

import Foundation
import UIKit.UIColor

class ViewModel {
    var statusText = Dynamic("")
    var statusColor = Dynamic(UIColor.lightGray)
    
    var authViewModel = AuthViewModel()
//    func userLoginPressed(login: String, password: String) {
//        if login != User.logins[0].login || password != User.logins[0].password {
//            statusText.value = "Log in failed"
//            statusColor.value = UIColor.systemRed
//        } else {
//            statusText.value = "You successfully logged in"
//            statusColor.value = UIColor.systemGreen
//        }
//    }
    
    func userLoginPressed(login: String, password: String ){
        authViewModel.login(email: login, password: password) { result in
            switch result {
            case .success(let user):
                self.statusText.value = "You successfully logged in!"
                self.statusColor.value = .systemGreen
                
            case .failure(let error):
                self.statusText.value = "Log in failed: \(error.localizedDescription)"
                self.statusColor.value = .systemRed
            }
        }
    }
    
    func userSignUpPressed(login: String, password: String) {
        authViewModel.register(email: login, password: password) { result in
            switch result {
            case .success(let user):
                self.statusText.value = "Registration successful"
                self.statusColor.value = .systemGreen
            case .failure(let error):
                self.statusText.value = "Registration failed: \(error.localizedDescription)"
                self.statusColor.value = .systemRed
            }
        }
    }
    
    
}
