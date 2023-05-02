//
//  SearchResultProviding.swift
//  BookStoreKit
//
//  Created by Nurikk T. on 01.05.2023.
//

import Foundation

typealias SearchResultsHandler = (Result<SearchBookResponse, Error>) -> Void

protocol SearchResultsProviding {
    func search(for request: SearchRequest, completionHandler: @escaping SearchResultsHandler)
}
