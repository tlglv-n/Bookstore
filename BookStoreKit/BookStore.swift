//
//  BookStore.swift
//  BookStoreKit
//
//  Created by Nurikk T. on 01.05.2023.
//

import Foundation

public struct BookStore {
    public static let deafultSearchEngine = SearchEngine()
    
    public static func fetchNewReleases(completionHandler: @escaping (Result<NewBooksResponse, Error>) -> Void) {
        NewBooksAPI().execute(completionHandler)
    }
    
    public static func fetchInfo(with isbn13: String, completionHandler: @escaping (Result<BookInfo, Error>) -> Void) {
        BookInfoAPI(isbn13: isbn13).execute(completionHandler)
    }
}
