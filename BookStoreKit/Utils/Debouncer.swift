//
//  Debouncer.swift
//  BookStoreKit
//
//  Created by Nurikk T. on 01.05.2023.
//

import Foundation

class Debouncer {
    let delay: TimeInterval
    
    private let queue: DispatchQueue
    private var workItem: DispatchWorkItem
    
    init(label: String, delay: TimeInterval) {
        self.queue = DispatchQueue(label: label)
        self.workItem = DispatchWorkItem(block: {})
        self.delay = delay
    }
    
    func schedule(block: @escaping () -> Void) {
        queue.async { [weak self] in
            guard let self = self else {return}
            
            self.workItem.cancel()
            
            let newItem = DispatchWorkItem(block: block)
            self.queue.asyncAfter(deadline: .now() + self.delay, execute: newItem)
            self.workItem = newItem
        }
    }
    
    
}
