//
//  SearchResult.swift
//  BookStoreKit
//
//  Created by Nurikk T. on 01.05.2023.
//

import Foundation

public struct SearchResult {
    
    public let request: SearchRequest
    
    public let books: [Book]
    
    init(books: [Book], searchText: String, page: Int) {
        self.request = SearchRequest(text: searchText, page:  page)
        self.books = books
    }
}
