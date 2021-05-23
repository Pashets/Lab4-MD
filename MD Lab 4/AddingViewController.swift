//
//  AddingViewController.swift
//  MD Lab 4
//
//  Created by Павел on 22.05.2021.
//

import Foundation
import UIKit

class AddingViewController: UIViewController {
    
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var subtitleTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBAction func addBookOrGetError(_ sender: Any) {
        if (titleTextField.text == "") {
            return errorLabel.text="Empty title field!"
        }
        if (subtitleTextField.text == "") {
            return errorLabel.text="Empty subtitle field!"
        }
        if (priceTextField.text == "") {
            return errorLabel.text="Empty price field!"
        }
        let price = Float(priceTextField.text!)
        if price == nil {
            return errorLabel.text="Price must be Float!"
        }
        let book = Book(
            title: titleTextField.text!,
            subtitle: subtitleTextField.text!,
            price: priceTextField.text!
        )
        let n: Int! = self.navigationController?.viewControllers.count
        let myBooksVCOld = self.navigationController?.viewControllers[n-2] as! ListViewController
        myBooksVCOld.addNewBook(book: book)
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.errorLabel.text = ""
    }
}
