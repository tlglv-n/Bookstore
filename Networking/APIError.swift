//
//  APIError.swift
//  Networking
//
//  Created by Nurikk T. on 27.04.2023.
//

import Foundation

public enum APIError: LocalizedError {
    case unknown
    
    public var errorDescription: String? {
        switch self {
        case .unknown:
            return "Unknown error has occured."
        }
    }
}
