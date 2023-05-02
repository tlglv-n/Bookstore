//
//  Unspecified.swift
//  Bookstore
//
//  Created by Nurikk T. on 02.05.2023.
//

import Foundation

func unspecified<T>(_ file: StaticString = #file, line: UInt = #line) -> T {
    preconditionFailure("\(T.self) is not specified", file: file, line: line)
}
