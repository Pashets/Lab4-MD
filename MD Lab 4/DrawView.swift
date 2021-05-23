//
//  UIViewMyClass.swift
//  MD Lab 2
//
//  Created by Павел on 24.04.2021.
//

import Foundation
import UIKit


enum Figure {
    case sinusoid;
    case ring;
}

class DrawView: UIView {
    var currentFigure: Figure?
    
    override func draw(_ rect: CGRect) {
        
        guard let currentFigure = currentFigure else {
            drawGraph()
            return
        }
        
        switch currentFigure {
            case .sinusoid:
                drawGraph()
            case .ring:
                drawRing()
        }
        
    }
    
    private func drawGraph(){
        
        let length_of_one: CGFloat = 25
        
        let leftPoint = CGPoint(
            x: bounds.size.width/2 - 2 * length_of_one * CGFloat(Double.pi),
            y: bounds.size.height/2
        )
        let rightPoint = CGPoint(
            x: bounds.size.width/2 + 2 * length_of_one * CGFloat(Double.pi),
            y: bounds.size.height/2
        )
        let bottomPoint = CGPoint(
            x: bounds.size.width / 2,
            y: bounds.size.height / 2 + 3 * length_of_one
        )
        let topPoint = CGPoint(
            x: bounds.size.width / 2,
            y: bounds.size.height / 2 - 3 * length_of_one
        )
        let path_black = UIBezierPath();
        let black = UIColor.black
        black.setStroke()
        // draw x ordinate
        path_black.move(to: leftPoint);
        path_black.addLine(to: rightPoint);
        // draw x arrow
        path_black.addLine(
            to: CGPoint(
                x: rightPoint.x - 15,
                y: rightPoint.y + 10
            )
        )
        path_black.move(to: rightPoint);
        path_black.addLine(
            to: CGPoint(
                x: rightPoint.x - 15,
                y: rightPoint.y - 10
            )
        )
        // draw x one point
        path_black.move(
            to: CGPoint(
                x: bounds.size.width / 2 + length_of_one,
                y: bounds.size.height / 2 - 10
            )
        )
        path_black.addLine(
            to: CGPoint(
                x: bounds.size.width / 2 + length_of_one,
                y: bounds.size.height / 2 + 10
            )
        )
        // draw y ordinate
        path_black.move(to: bottomPoint);
        path_black.addLine(to: topPoint);
        // draw y arrow
        path_black.addLine(
            to: CGPoint(
                x: topPoint.x - 10,
                y: topPoint.y + 15
            )
        )
        path_black.move(to: topPoint);
        path_black.addLine(
            to: CGPoint(
                x: topPoint.x + 10,
                y: topPoint.y + 15
            )
        )
        // draw y one point
        path_black.move(
            to: CGPoint(
                x: bounds.size.width / 2 - 10,
                y: bounds.size.height / 2 + length_of_one
            )
        )
        path_black.addLine(
            to: CGPoint(
                x: bounds.size.width / 2 + 10,
                y: bounds.size.height / 2 + length_of_one
            )
        )
        path_black.stroke()
        
        
        let path = UIBezierPath();
        let blue = UIColor.blue
        blue.setStroke()
        path.move(to: leftPoint)
        for point in 1...Int(Double(length_of_one) * 4.0 * Double.pi) {
            path.addLine(
                to: CGPoint(
                    x: leftPoint.x + CGFloat(point),
                    y: leftPoint.y - CGFloat(
                        sin(
                            CGFloat(-2 * Double.pi + Double(point)/Double(length_of_one))
                        ) * length_of_one
                    )
                )
            )
        }
        path.stroke()
    }
    
    
    private func drawRing(){
        
        let wholeCircle = 2 * Float.pi
        
        let path_brown = UIBezierPath();
        path_brown.lineWidth = 50
        path_brown.addArc(
            withCenter: CGPoint(x: bounds.size.width/2,y:bounds.size.height/2),
            radius: CGFloat(60),
            startAngle: CGFloat(0),
            endAngle: CGFloat(0.05 * wholeCircle),
            clockwise: true
        )
        let brown = UIColor.brown
        brown.setStroke()
        path_brown.stroke()
        
        let path_light_blue = UIBezierPath();
        path_light_blue.lineWidth = 50
        path_light_blue.addArc(
            withCenter: CGPoint(x: bounds.size.width/2,y:bounds.size.height/2),
            radius: CGFloat(60),
            startAngle: CGFloat(0.05 * wholeCircle),
            endAngle: CGFloat(0.1 * wholeCircle),
            clockwise: true
        )
        let light_blue = UIColor.init(red: 0.16, green: 1.0, blue: 1.0, alpha: 1)
        light_blue.setStroke()
        path_light_blue.stroke()
        
        let path_orange = UIBezierPath();
        path_orange.lineWidth = 50
        path_orange.addArc(
            withCenter: CGPoint(x: bounds.size.width/2,y:bounds.size.height/2),
            radius: CGFloat(60),
            startAngle: CGFloat(0.1 * wholeCircle),
            endAngle: CGFloat(0.2 * wholeCircle),
            clockwise: true
        )
        let orange = UIColor.orange
        orange.setStroke()
        path_orange.stroke()
        
        let path_blue = UIBezierPath();
        path_blue.lineWidth = 50
        path_blue.addArc(
            withCenter: CGPoint(x: bounds.size.width/2,y:bounds.size.height/2),
            radius: CGFloat(60),
            startAngle: CGFloat(0.2 * wholeCircle),
            endAngle: CGFloat(wholeCircle),
            clockwise: true
        )
        let blue = UIColor.blue
        blue.setStroke()
        path_blue.stroke()
    }
    
    func drawFigure(selectedFigure: Figure) {
        currentFigure = selectedFigure
        setNeedsDisplay()
    }
}
