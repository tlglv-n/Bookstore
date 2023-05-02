//
//  SearchEngineDelegate.swift
//  BookStoreKit
//
//  Created by Nurikk T. on 01.05.2023.
//

import Foundation

public protocol SearchEngineDelegate: AnyObject {
    func searchEngine(_ engine: SearchEngine, didStart searchRequest: SearchRequest)
    
    func searchEngine(_ engine: SearchEngine, didReceive searchResult: Result<SearchResult, SearchError>)
}
