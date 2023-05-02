//
//  Book.swift
//  Bookstore
//
//  Created by Nurikk T. on 30.04.2023.
//

import Foundation

public struct Book: Decodable {
    
    public let title: String
    public let subtitle: String
    public let price: String
    public let isbn13: String
    public let thumbnailURL: URL?
    public let purchaseURL: URL?
    
    enum CodingKeys: String, CodingKey {
        case title, subtitle, isbn13, price
        case thumbnailURL = "image"
        case purchaseURL = "url"
    }
}

extension Book: CustomStringConvertible {
    public var description: String {
        return "<Book-\(title)>"
    }
}
