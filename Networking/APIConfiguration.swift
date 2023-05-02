//
//  APIConfiguration.swift
//  Networking
//
//  Created by Nurikk T. on 27.04.2023.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

public struct APIConfiguration {
    public let method: HTTPMethod
    public let url: URL
    public let parameters: [String: Any]?
    
    public init(method: HTTPMethod = .get,
                base: URL,
                path: String,
                parameters: [String: Any]? = nil) {
        self.method = method
        self.url = base.appendingPathComponent(path)
        self.parameters = parameters
    }
}
