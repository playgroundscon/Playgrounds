//
//  TableViewCell.swift
//  Playgrounds
//
//  Created by Andyy Hope on 20/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let defaultIndent: CGFloat = 16.0
    
    var indent: CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .clear
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context: CGContext = UIGraphicsGetCurrentContext() else { return }
        
        let strokeWidth: CGFloat = 0.5
        let yPos: CGFloat = rect.maxY - strokeWidth
        let xPos: CGFloat = indent
        let width: CGFloat = rect.width - xPos
        let strokeColor: UIColor = UIColor(white: 0.5, alpha: 0.4)
        
        context.setStrokeColor(strokeColor.cgColor)
        context.setLineWidth(strokeWidth)
        context.move(to: CGPoint(x: xPos, y: yPos))
        context.addLine(to: CGPoint(x: xPos + width, y: yPos))
        context.strokePath()
    }
    
    var separatorIndent: CGFloat {
        get {
            return indent
        }
        set {
            if indent != newValue {
                indent = newValue
                setNeedsDisplay()
            }
        }
    }
    
    func removeSeparator() {
        separatorIndent = UIScreen.main.bounds.width
    }
}
