//
//  Book.swift
//  Bookstore
//
//  Created by Nurikk T. on 30.04.2023.
//

import Foundation
import CoreData
public struct Book: Decodable, Equatable {
    
    public var title: String
    public var subtitle: String
    public var price: String
    public var isbn13: String
    public var thumbnailURL: URL?
    public var purchaseURL: URL?

    
    
    
    enum CodingKeys: String, CodingKey {
        case title, subtitle, isbn13, price
        case thumbnailURL = "image"
        case purchaseURL = "url"
    }
    public static func == (lhs: Book, rhs: Book) -> Bool {
        return lhs.title == rhs.title &&
            lhs.subtitle == rhs.subtitle &&
            lhs.price == rhs.price &&
            lhs.isbn13 == rhs.isbn13 &&
        lhs.thumbnailURL == rhs.thumbnailURL &&
        lhs.purchaseURL == rhs.purchaseURL
    }
    
}

extension Book: CustomStringConvertible {
    public var description: String {
        return "<Book-\(title)>"
    }
}

extension Book {
    public var isFavorite: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "\(isbn13)_favorite")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "\(isbn13)_favorite")
        }
    }
    
}
