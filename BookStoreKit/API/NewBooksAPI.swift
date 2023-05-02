//
//  NewBooksAPI.swift
//  Bookstore
//
//  Created by Nurikk T. on 30.04.2023.
//

import Foundation
import Networking

struct NewBooksAPI: API {
    typealias ResponseType = NewBooksResponse
    let configuration: APIConfiguration
    
    init() {
        configuration = APIConfiguration(base: BookStoreConfiguration.shared.baseURL, path: "/1.0/new")
    }
}
