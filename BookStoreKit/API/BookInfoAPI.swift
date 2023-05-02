//
//  BookInfoAPI.swift
//  Networking
//
//  Created by Nurikk T. on 28.04.2023.
//

import Foundation
import Networking

struct BookInfoAPI: API {
    typealias ResponseType = BookInfo
    let configuration: APIConfiguration
    
    init(isbn13: String) {
        configuration = APIConfiguration(base: BookStoreConfiguration.shared.baseURL,
                                         path: "/1.0/books/\(isbn13)")
    }
}
