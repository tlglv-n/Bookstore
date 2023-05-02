//
//  ITBookStoreService.swift
//  Bookstore
//
//  Created by Nurikk T. on 01.05.2023.
//

import Foundation
import BookStoreKit

struct ITBookStoreService {
    var searchEngine: SearchEngine {
        return BookStore.deafultSearchEngine
    }
    
    func fetchNewReleases(completionHandler: @escaping (Result<NewBooksResponse, Error>) -> Void) {
        BookStore.fetchNewReleases(completionHandler: completionHandler)
    }
    
    func fetchInfo(with isbn13: String, completionHandler: @escaping (Result<BookInfo, Error>) -> Void) {
        BookStore.fetchInfo(with: isbn13, completionHandler: completionHandler)
    }
}
