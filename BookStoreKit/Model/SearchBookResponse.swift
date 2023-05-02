//
//  SearchBookResponse.swift
//  Bookstore
//
//  Created by Nurikk T. on 30.04.2023.
//

import Foundation

struct SearchBookResponse: Decodable {
    let total: Int
    let page: Int
    let error: String
    let books: [Book]
    
    enum CodingKeys: String, CodingKey {
        case error, total, page, books
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let totalString = try container.decode(String.self, forKey: .total)
        if let totalInt = Int(totalString) {
            total = totalInt
        } else {
            throw DecodingError.typeMismatch(Int.self, DecodingError.Context(codingPath: [CodingKeys.total], debugDescription: "total could not be converted to Int type"))
        }
        
        let pageString = try container.decodeIfPresent(String.self, forKey: .page)
        if let pageInt = pageString.flatMap(Int.init) {
            page = pageInt
        } else {
            page = 0
        }
        
        error = try container.decode(String.self, forKey: .error)
        books = try container.decode([Book].self, forKey: .books)
    }
}
