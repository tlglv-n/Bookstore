//
//  AuthServiceProtocol.swift
//  Bookstore
//
//  Created by Nurikk T. on 15.04.2023.
//

import Foundation
import Firebase

protocol AuthServiceProtocol {
    func createUser(withEmail email: String, password: String, completion: @escaping (Result<AuthDataResult, Error>) -> Void)
    func signIn(withEmail email: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
    func signOut() throws
    
}
