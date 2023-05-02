//
//  SearchEngineAPI.swift
//  BookStoreKit
//
//  Created by Nurikk T. on 01.05.2023.
//

import Foundation
import Networking

struct SearchBookAPI: API {
    typealias ResponseType = SearchBookResponse
    let configuration: APIConfiguration
    
    init(searchText: String, page: Int) {
        configuration = APIConfiguration(base: BookStoreConfiguration.shared.baseURL, path: "/1.0/search/\(searchText)/\(page)")
    }
}
