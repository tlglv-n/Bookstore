//
//  SearchRequest.swift
//  BookStoreKit
//
//  Created by Nurikk T. on 01.05.2023.
//

import Foundation


public struct SearchRequest {
    public let text: String
    public let page: Int
}

extension SearchRequest: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "<SearchRequest: text=\(text), page=\(page)>"
    }
}
