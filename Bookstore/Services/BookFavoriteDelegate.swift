//
//  BookFavoriteDelegate.swift
//  Bookstore
//
//  Created by Nurikk T. on 11.05.2023.
//

import Foundation
import BookStoreKit

protocol BookFavoriteDelegate: AnyObject {
    func didToggleFavorite(for book: Book)
}
