//
//  BookInfoViewController.swift
//  Bookstore
//
//  Created by Nurikk T. on 03.05.2023.
//

import UIKit

class BookInfoViewController: UIViewController {

    private(set) lazy var isbn13: String = unspecified()
    private lazy var bookStore: BookStoreService = unspecified()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    static func instatiate(isbn13: String, bookStore: BookStoreService) -> BookInfoViewController {
        let bookInfo = UIStoryboard.main.instantiateViewController(BookInfoViewController.self)
        bookInfo.bookStore = bookStore
        bookInfo.isbn13 = isbn13
        return bookInfo
    }
}
