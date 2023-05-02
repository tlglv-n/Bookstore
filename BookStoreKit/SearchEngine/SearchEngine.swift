//
//  SearchEngine.swift
//  BookStoreKit
//
//  Created by Nurikk T. on 01.05.2023.
//

import Foundation

public final class SearchEngine {
    
    private var searchText: String = ""
    private var isSearching: Bool = false
    private var nextRequest: SearchRequest?
    private var debouncer = Debouncer(label: "com.nsoojin.search.book", delay: 0.3)
    private var provider: SearchResultsProviding
    
    weak public var delegate: SearchEngineDelegate?
    
    public convenience init() {
        self.init(provider: ITBookStoreProvider())
    }
    
    public convenience init(delegate: SearchEngineDelegate) {
        self.init(provider: ITBookStoreProvider())
        self.delegate = delegate
    }
    
    init(provider: SearchResultsProviding) {
        self.provider = provider
    }
    
    public var hasNextPage: Bool {
        return nextRequest != nil
    }
    
    public func search(for text: String) {
        if text.isEmpty { return }
        
        searchText = text
        let request = SearchRequest(text: text, page: 1)
        
        debouncer.schedule { [weak self] in
            guard let self = self else { return }
            
            self.executeOnMainQueue { self.delegate?.searchEngine(self, didStart: request) }
            self._search(for: SearchRequest(text: text, page: 1))
        }
    }
    
    public func requestNextPage() {
        guard let request = nextRequest else {
            executeOnMainQueue { self.delegate?.searchEngine(self, didReceive: .failure(.endOfResult)) }
            return
        }
        
        if isSearching == false {
            _search(for: request)
        }

    }
    
    private func executeOnMainQueue(_ block: @escaping () -> Void) {
        if Thread.isMainThread {
            block()
        } else {
            DispatchQueue.main.async(execute: block)
        }
    }
    
    private func _search(for request: SearchRequest) {
        if request.text.isEmpty {return}
        
        isSearching = true
        
        provider.search(for: request) { [weak self] (result) in
            guard let self = self else { return }
            
            result.success(self.responseHandler(for: request))
                  .catch(self.handle)
            
            self.isSearching = false
        }
    }
    
    private func responseHandler(for request: SearchRequest) -> (SearchBookResponse) -> Void {
        return { [weak self] (response) in
            self?.handle(response, fromRequest: request)
        }
    }
    
    private func handle(_ response: SearchBookResponse, fromRequest request: SearchRequest) {
        
        if request.text != searchText {return}
        
        nextRequest = nextRequest(from: response)
        
        let books = response.books
        if books.isEmpty {
            if response.page > 1 {
                executeOnMainQueue { self.delegate?.searchEngine(self, didReceive: .failure(.endOfResult))}
            } else {
                executeOnMainQueue { self.delegate?.searchEngine(self, didReceive: .failure(.notFound)) }
            }
        } else {
            let result = SearchResult(books: books, searchText: request.text, page: response.page)
            executeOnMainQueue { self.delegate?.searchEngine(self, didReceive: .success(result)) }
        }
        
    }
    
    private func handle(_ error: Error) {
        executeOnMainQueue { self.delegate?.searchEngine(self, didReceive: .failure(.apiFailure(error))) }
    }
    
    private func nextRequest(from response: SearchBookResponse) -> SearchRequest? {
        if response.page > 1 && response.total == 0 {return nil}
        
        return SearchRequest(text: searchText, page: response.page + 1)
    }
    
}
