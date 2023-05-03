//
//  Unwrappable.swift
//  Bookstore
//
//  Created by Nurikk T. on 03.05.2023.
//

import Foundation

protocol Unwrappable {
    associatedtype Wrapped
    func unwrap(errorIfNil: Error?) throws -> Wrapped
}

extension Optional: Unwrappable {
    func unwrap(errorIfNil error: Error? = nil) throws -> Wrapped {
        switch self {
        case .some(let unwrapped):
            return unwrapped
        case .none:
            throw error ?? ResultError.nilValue
        }
    }
}

extension Result: Unwrappable {
    func unwrap(errorIfNil: Error? = nil) throws -> Success {
        switch self {
        case .success(let value):
            return value
        case .failure(let error):
            throw errorIfNil ?? error
        }
    }
}
