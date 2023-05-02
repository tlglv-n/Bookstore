//
//  APIClient.swift
//  Networking
//
//  Created by Nurikk T. on 27.04.2023.
//

import Foundation

public struct APIClient {
    public static let shared = APIClient(session: URLSession.shared)
    
    public func requestData(with urlRequest: URLRequest, completionHandler: @escaping (Result<Data, Error>) -> Void) {
        session.dataTask(with: urlRequest) { (data, _, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(.failure(error ?? APIError.unknown))
                }
                return
            }
            
            DispatchQueue.main.async {
                completionHandler(.success(data))
            }
        }.resume()
    }
    
    public func requestData(with url: URL, completionHandler: @escaping (Result<Data, Error>) -> Void) {
        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(.failure(error ?? APIError.unknown))
                }
                return
            }
            
            DispatchQueue.main.async {
                completionHandler(.success(data))
            }
        }.resume()
    }
    
    public init(session: URLSession) {
        self.session = session
    }
    
    private let session: URLSession
}
