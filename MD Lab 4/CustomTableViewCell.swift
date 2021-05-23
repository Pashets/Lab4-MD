//
//  CustomTableViewCell.swift
//  MD Lab 3
//
//  Created by Павел on 07.05.2021.
//

import Foundation
import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imageOfBook: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var myContentView: UIView!
    @IBOutlet weak var myStackView: UIStackView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    func setImageAndLabel(book: Book) {
        if (book.image != "") {
            let name = String(book.image.prefix(book.image.count - 4))
            if let path = Bundle.main.path(forResource: name, ofType: "png") {
                imageOfBook.image = UIImage(contentsOfFile: path)
                myContentView.bottomAnchor.constraint(greaterThanOrEqualTo: imageOfBook.bottomAnchor, constant: 10).isActive = true
            }
        } else {
            myContentView.bottomAnchor.constraint(greaterThanOrEqualTo: imageOfBook.bottomAnchor, constant: 10).isActive = false
            imageOfBook.image = nil
        }
        myContentView.bottomAnchor.constraint(greaterThanOrEqualTo: myStackView.bottomAnchor, constant: 10).isActive = true
        title.text = book.title
        if (book.subtitle == "") {
            subtitle.text = nil
            subtitle.isHidden = true
        } else {
            subtitle.isHidden = false
            subtitle.text = book.subtitle
        }
        if (book.price == "") {
            price.text = nil
            price.isHidden = true
        } else {
            price.isHidden = false
            price.text = book.price
        }
    }
}
