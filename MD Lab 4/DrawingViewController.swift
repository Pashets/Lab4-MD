//
//  DrawingViewController.swift
//  MD Lab 2
//
//  Created by Павел on 24.04.2021.
//

import Foundation
import UIKit

class DrawingViewContoller: UIViewController {
    
    @IBOutlet weak var drawView: DrawView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func DrawSinusoid(_ sender: Any) {
        drawView.drawFigure(selectedFigure: .sinusoid)
    }
    @IBAction func DrawRing(_ sender: Any) {
        drawView.drawFigure(selectedFigure: .ring)
    }
}
