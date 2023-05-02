//
//  NewBooksResponse.swift
//  Bookstore
//
//  Created by Nurikk T. on 30.04.2023.
//

import Foundation

public struct NewBooksResponse: Decodable {
    public let books: [Book]
    public let total: String
    public let error: String
}
