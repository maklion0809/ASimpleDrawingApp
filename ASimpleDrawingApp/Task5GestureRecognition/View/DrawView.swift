//
//  DrawView.swift
//  Task5GestureRecognition
//
//  Created by Tymofii (Work) on 04.10.2021.
//

import UIKit

class DrawView: UIView {
    
    // MARK: - Configuration
    
    private enum Configuration {
        static let pointRadius: CGFloat = 10
        static let lineWidth: CGFloat = 5
    }
    
    // MARK: - Variable
    
    private var lines: [[CGPoint]] = [[]]
    private var point: [CGPoint] = []
    private var firstPoint = CGPoint.zero
    
    // MARK: - Lifecycle of touch
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: self) else { return }
        lines.append([touch])
        firstPoint = touch
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: self) else { return }
        guard var lastLine = lines.popLast() else { return }
        lastLine.append(touch)
        lines.append(lastLine)
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: self) else { return }
        if firstPoint == touch {
            point.append(touch)
            lines.removeLast()
            setNeedsDisplay()
        }
    }
    
    // MARK: - Draw
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawLine()
        drawPoint()
    }
    
    // MARK: - Functions for drawing

    
    private func drawLine() {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setLineWidth(Configuration.lineWidth)
        context.setStrokeColor(UIColor.red.cgColor)
        for line in lines {
            for (index, item) in line.enumerated() {
                if index == 0 {
                    context.move(to: item)
                } else {
                    context.addLine(to: item)
                }
            }
        }
        context.strokePath()
    }
    
    private func drawPoint() {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setFillColor(UIColor.black.cgColor)
        for item in point {
            context.addArc(center: item, radius: Configuration.pointRadius, startAngle: 0.0, endAngle: CGFloat.pi * 2, clockwise: false)
            context.fillPath()
        }
        context.closePath()
    }
    
    // MARK: - Function for cleaning
    
    func clearScreen() {
        lines.removeAll()
        point.removeAll()
        setNeedsDisplay()
    }
    
}
