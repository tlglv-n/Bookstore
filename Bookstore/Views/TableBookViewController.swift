//
//  TableBookViewController.swift
//  Bookstore
//
//  Created by Nurikk T. on 01.05.2023.
//

import UIKit
import BookStoreKit

class TableBookViewController: UIViewController {
    
    lazy var bookStore: BookStoreService = unspecified()
    @IBOutlet weak var tableView: UITableView!
    
    private(set) var books = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        bookStore.fetchNewReleases(completionHandler: handle)
    }
    
    func handle(_ result: Result<NewBooksResponse, Error>) {
        switch result {
        case .success(let response):
            books = response.books
            tableView?.reloadData()
        case .failure:
            return
        }
    }
    
    func setupTableView() {
        tableView?.register(BookCell.self)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.rowHeight = 250
        tableView?.estimatedRowHeight = 250
        tableView?.tableFooterView = UIView()
        tableView?.accessibilityIdentifier = "TableBookView"
    }
 

}

extension TableBookViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(BookCell.self, for: indexPath)
        
        let book = books[indexPath.row]

        cell.identifier = book.isbn13
        cell.titleLabel?.text = book.title
        cell.subtitleLabel?.text = book.subtitle
        cell.priceLabel?.text = book.price
        cell.isbn13Label?.text = book.isbn13
        
        if let thumbnailURL = book.thumbnailURL {
            ImageProvider.shared.fetch(from: thumbnailURL) { (result) in
                if case .success(let image) = result, cell.identifier == book.isbn13 {
                    cell.thumbnailImageView?.image = image
                }
            }
        }
        return cell
    }

}

extension TableBookViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = books[indexPath.row]
        let bookInfoViewController = BookInfoViewController.instatiate(isbn13: book.isbn13, bookStore: bookStore, book: book)
        present(bookInfoViewController, animated: true, completion: nil)
    }
}

extension TableBookViewController: BookStoreView {
    func set(_ bookStore: BookStoreService) {
        self.bookStore = bookStore
    }
}
