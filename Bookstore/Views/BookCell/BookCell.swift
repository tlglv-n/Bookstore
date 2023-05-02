//
//  BookCell.swift
//  Bookstore
//
//  Created by Nurikk T. on 01.05.2023.
//

import UIKit

class BookCell: UITableViewCell {

    var identifier: String?
    
    @IBOutlet weak var thumbnailImageView: UIImageView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var subtitleLabel: UILabel?
    
    @IBOutlet weak var isbn13Label: UILabel?
    @IBOutlet weak var priceLabel: UILabel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }

    
}
