//
//  BookInfo.swift
//  Bookstore
//
//  Created by Nurikk T. on 30.04.2023.
//

import Foundation

public struct BookInfo: Decodable {
    public let title: String
        
    /// The subtitle of the book.
    public let subtitle: String
    
    /// The authors of the book, separated by commas.
    public let authors: String
    
    /// The name of the publisher.
    public let publisher: String
    
    /// The language in which the book is written.
    public let language: String
    
    /// The unique ISBN-10 identifer of the book.
    public let isbn10: String?
    
    /// The unique ISBN-13 identifer of the book.
    public let isbn13: String
    
    /// The number pages of the book.
    public let pages: String
    
    /// The year when the book was published.
    public let year: String
    
    /// The rating of the book in IT Bookstore.
    public let rating: String
    
    /// The short description of the book.
    public let shortDescription: String
    
    /// The price of the book in dollars.
    public let price: String
    
    /// The URL path to the cover image of the book.
    public let thumbnailURL: URL?
    
    /// The URL path to a website in IT Bookstore to purchase.
    public let purchaseURL: URL?
    
    /// The error code of the request, if exists.
    public let error: String?
    
    enum CodingKeys: String, CodingKey {
        case title, subtitle, authors, publisher, language
        case isbn10, isbn13, pages, year, rating, error, price
        case shortDescription = "desc"
        case thumbnailURL = "image"
        case purchaseURL = "url"
    }
}

extension BookInfo: CustomStringConvertible {
    public var description: String {
        return "<BookInfo-\(title)>"
    }
}
