//
//  Foundation+Extensions.swift
//  Bookstore
//
//  Created by Nurikk T. on 03.05.2023.
//

import Foundation

extension Optional where Wrapped: Collection {
    var isEmpty: Bool {
        return self?.isEmpty ?? true
    }
}
