//
//  ImageProvider.swift
//  Bookstore
//
//  Created by Nurikk T. on 02.05.2023.
//

import Foundation
import Networking
import UIKit

typealias ImageCompletionHandler = (Result<UIImage, Error>) -> Void
private typealias ImageCacheKey = NSString

struct ImageProvider {
    static let shared = ImageProvider()
    
    private let cache: NSCache<ImageCacheKey, UIImage>
    private init() {
        let cache = NSCache<NSString, UIImage>()
        cache.name = "BookStore.ImageCache"
        cache.countLimit = 200
        self.cache = cache
    }
    
    func fetch(from url: URL, completionHandler: ImageCompletionHandler? = nil) {
        if let image = cache.object(forKey: url.imageCacheKey) {
            completionHandler?(.success(image))
        } else {
            downloadImage(from: url) { (result) in
                result.success { self.cache.setObject($0, forKey: url.imageCacheKey) }
                completionHandler?(result)
            }
        }
        
    }
    
    private func downloadImage(from url: URL, completionHandler: @escaping ImageCompletionHandler) {
        APIClient.shared.requestData(with: url) {
            let imageResult = $0.mapThrow { try UIImage(data: $0).unwrap(errorIfNil: ImageProviderError.malformedData) }
            completionHandler(imageResult)
        }
    }
    
}

private extension URL {
    var imageCacheKey: ImageCacheKey {
        return absoluteString as NSString
    }
}
