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

    var signIn = false
    
    func userLoginPressed(login: String, password: String ){
        authViewModel.login(email: login, password: password) { result in
            switch result {
            case .success(let user):
                self.statusText.value = "You successfully logged in!"
                self.statusColor.value = .systemGreen
                self.signIn = true
                
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
    
    func signInProccess() -> Bool {
        if signIn == true {
            return true
        }
        return false
    }
    
    
}
