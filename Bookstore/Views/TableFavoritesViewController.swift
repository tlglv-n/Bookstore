//
//  TableFavorites.swift
//  Bookstore
//
//  Created by Nurikk T. on 17.04.2023.
//

import UIKit
import BookStoreKit

class TableFavoritesViewController: TableBookViewController {

    @IBOutlet weak var favoriteTableView: UITableView!
    
    private let bookInfo = BookInfoViewController()
    private let tableBook = TableBookViewController()
    var favorites = [Book]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
//        bookStore.fetchNewReleases(completionHandler: handle)
        bookStore.fetchNewReleases(completionHandler: handle)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(favorites)
    }

    override func setupTableView() {
        favoriteTableView?.register(BookCell.self)
        favoriteTableView?.delegate = self
        favoriteTableView?.dataSource = self
        favoriteTableView?.rowHeight = 250
        favoriteTableView?.estimatedRowHeight = 250
        favoriteTableView?.tableFooterView = UIView()
        favoriteTableView?.accessibilityIdentifier = "TableFavoriteView"
    }
    
    override func handle(_ result: Result<NewBooksResponse, Error>) {
        switch result {
        case .success(let response):
            
            favorites = response.books.filter {$0.isFavorite}
            favoriteTableView?.reloadData()
        case .failure:
            return
        }
    }
    

    
}
extension TableFavoritesViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(BookCell.self, for: indexPath)
        let book = favorites[indexPath.row]
        
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
extension TableFavoritesViewController {
    override func tableView (_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = favorites[indexPath.row]
        let bookInfoViewController = BookInfoViewController.instatiate(isbn13: book.isbn13 ?? "", bookStore: bookStore, book: book)
        present(bookInfoViewController, animated: true, completion: nil)
    }
}

