//
//  SearchError.swift
//  BookStoreKit
//
//  Created by Nurikk T. on 01.05.2023.
//

import Foundation

public enum SearchError: LocalizedError {
    case notFound
    case endOfResult
    case apiFailure(Error)
    
    public var errorDescription: String? {
        switch self {
        case .notFound:
            return "Your search did not have any results."
        case .endOfResult:
            return "This is the end of the result."
        case .apiFailure(let error):
            return "Something went wrong from server. (\(error.localizedDescription))"
        }
    }
}

extension SearchError {
    public static func == (lhs: SearchError, rhs: SearchError) -> Bool {
        switch (lhs, rhs) {
        case (.notFound, .notFound):
            return true
        case (.endOfResult, .endOfResult):
            return true
        default:
            return false
        }
    }
}
