//
//  Book.swift
//  MD Lab 3
//
//  Created by Павел on 07.05.2021.
//

import Foundation

struct Book: Codable {
    var title: String
    var subtitle: String
    var authors: String?
    var publisher: String?
    var isbn13: String
    var pages: String?
    var year: String?
    var rating: String?
    var desc: String?
    var price: String
    var image: String
    
    init(title: String, subtitle: String, price: String) {
        self.title = title
        self.subtitle = subtitle
        self.price = price
        self.image = ""
        self.isbn13 = String(arc4random())
    }
}

struct Books: Codable {
    var books: [Book]
}
