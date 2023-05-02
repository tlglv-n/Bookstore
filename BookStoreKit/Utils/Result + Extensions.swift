//
//  Result + Extensions.swift
//  BookStoreKit
//
//  Created by Nurikk T. on 01.05.2023.
//

import Foundation

enum ResultError: Error {
    case nilValue
}

extension Result {
    func mapThrow<NewSucces>(_ transform: (Success) throws -> NewSucces) -> Result<NewSucces, Error> {
        do {
            return .success(try transform(try get()))
        } catch {
            return .failure(error)
        }
    }
    
    @discardableResult
    func success(_ successHandler: (Success) -> Void) -> Result<Success, Failure> {
        if case .success(let value) = self {
            successHandler(value)
        }
        
        return self
    }

    @discardableResult
    func `catch`(_ failureHandler: (Failure) -> Void) -> Result<Success, Failure> {
        if case .failure(let error) = self {
            failureHandler(error)
        }
        
        return self
    }
    
}



