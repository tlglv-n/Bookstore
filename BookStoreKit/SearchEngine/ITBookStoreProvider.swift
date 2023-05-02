//
//  ITBookStoreProvider.swift
//  BookStoreKit
//
//  Created by Nurikk T. on 01.05.2023.
//

import Foundation

struct ITBookStoreProvider: SearchResultsProviding {
    func search(for request: SearchRequest, completionHandler: @escaping SearchResultsHandler) {
        SearchBookAPI(searchText: request.text, page: request.page).execute(completionHandler)
    }
}
