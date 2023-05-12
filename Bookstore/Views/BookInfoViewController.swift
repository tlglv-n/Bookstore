//
//  BookInfoViewController.swift
//  Bookstore
//
//  Created by Nurikk T. on 03.05.2023.
//

import UIKit
import BookStoreKit
import CoreData

class BookInfoViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var isbn13Label: UILabel!
    @IBOutlet weak var pagesLabel: UILabel!
    
    private var bookInfo: BookInfo? {
        didSet {
            layoutInfo()
        }
    }
    
//    private var isFavorite = false
    private lazy var book: Book = unspecified()
    private(set) lazy var isbn13: String = unspecified()
    private lazy var bookStore: BookStoreService = unspecified()
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    
    static func instatiate(isbn13: String, bookStore: BookStoreService, book: Book) -> BookInfoViewController {
        let bookInfo = UIStoryboard.main.instantiateViewController(BookInfoViewController.self)
        bookInfo.bookStore = bookStore
        bookInfo.isbn13 = isbn13
        bookInfo.book = book
        return bookInfo
    }
    
    func setupViews() {
//        scrollView?.isHidden = true
        bookStore.fetchInfo(with: isbn13) { [weak self] (result) in
            guard let self = self else {return}
            
            result.success {self.bookInfo = $0}
                .catch(self.handle)
        }
    }
    
    func layoutInfo() {
        guard let info = bookInfo else {return}
        
        titleLabel?.text = info.title
        subtitleLabel?.text = info.subtitle
        authorsLabel?.text = info.authors
        priceLabel?.text = info.price
        descriptionLabel?.text = info.shortDescription
        publisherLabel?.text = info.publisher
        yearLabel?.text = info.year
        pagesLabel?.text = info.pages
        isbn13Label?.text = info.isbn13
        
        if let thumbnailURL = info.thumbnailURL {
            ImageProvider.shared.fetch(from: thumbnailURL) { [weak self] (result) in
                self?.thumbnailImageView?.image = try? result.get()
            }
        }
    }
    
    private func handle(_ error: Error) {
        let alert = UIAlertController(title: error.localizedDescription, message: nil, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addActions([cancel])
        present(alert, animated: true)
    }
    
    @IBAction func buyButtonTapped(_ sender: Any) {
        if let url = bookInfo?.purchaseURL {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        book.isFavorite.toggle()
        UserDefaults.standard.synchronize()
        dismiss(animated: true)
    }
    
    private func save() {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Book", in: context) else {return}
        guard var savedBook = NSManagedObject(entity: entityDescription, insertInto: context) as? Book else {return}
        
        savedBook.title = book.title
        savedBook.subtitle = book.subtitle
        savedBook.isbn13 = book.isbn13
        savedBook.purchaseURL = book.purchaseURL
        savedBook.thumbnailURL = book.thumbnailURL
        savedBook.price = book.price
        
        if context.hasChanges {
            do {
                try context.save()
            } catch let error {
                print(error)
            }
        }
        
        dismiss(animated: true)
    }
}
