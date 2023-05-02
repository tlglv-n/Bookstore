//
//  BookStoreService.swift
//  Bookstore
//
//  Created by Nurikk T. on 23.04.2023.
//

import Foundation
import BookStoreKit

protocol BookStoreService {
    var searchEngine: SearchEngine { get }
    func fetchNewReleases(completionHandler: @escaping (Result<NewBooksResponse, Error>) -> Void)
    func fetchInfo(with isbn13: String, completionHandler: @escaping (Result<BookInfo, Error>) -> Void)
}
