//
//  API.swift
//  Networking
//
//  Created by Nurikk T. on 27.04.2023.
//

import Foundation

public protocol API {
    associatedtype ResponseType: Decodable
    var configuration: APIConfiguration {get}
}
    
extension API {
    public func execute(using client: APIClient = APIClient.shared,
                        _ completionHandler: @escaping (Result<ResponseType, Error>) -> Void) {
        var urlRequest = URLRequest(url: configuration.url)
        urlRequest.httpMethod = configuration.method.rawValue
        
        client.requestData(with: urlRequest) { (result) in
            switch result {
            case .success(let data):
                do {
                    let result = try JSONDecoder().decode(ResponseType.self, from: data)
                    DispatchQueue.main.async {
                        completionHandler(.success(result))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completionHandler(.failure(error))
                    }
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
