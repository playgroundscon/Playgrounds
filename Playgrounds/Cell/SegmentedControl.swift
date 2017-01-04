//
//  SegmentedControl.swift
//  Playgrounds
//
//  Created by Andyy Hope on 20/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit

final class SegmentedControl: UISegmentedControl {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        style()
    }
    
    override init(items: [Any]?) {
        super.init(items: items)
        style()
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        style()
    }
    
    func style() {
        setNeedsDisplay()
        apportionsSegmentWidthsByContent = false
//        let emptyImage = UIImage(named: "SegmentedControlBackground")!
//        setBackgroundImage(emptyImage, for: .selected, barMetrics: .default)
//        setBackgroundImage(emptyImage, for: .highlighted, barMetrics: .default)
//        setBackgroundImage(emptyImage, for: .normal, barMetrics: .default)
//        backgroundColor = .clear
//        setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        let normalTextAttributes: [String : AnyObject] = [
            NSFontAttributeName: UIFont.systemFont(ofSize: 13),
            NSForegroundColorAttributeName : UIColor.text(.primary)]
        
        let selectedTextAttributes: [String : AnyObject] = [
            NSFontAttributeName: UIFont.boldSystemFont(ofSize: 13),
            NSForegroundColorAttributeName : UIColor.text(.primary)]
        
        setTitleTextAttributes(normalTextAttributes, for: .normal)
        setTitleTextAttributes(selectedTextAttributes, for: .selected)
    }
    
    override func draw(_ rect: CGRect) {
        guard let context: CGContext = UIGraphicsGetCurrentContext() else { return }
        
//        let strokeWidth: CGFloat = 8
//        let yPos: CGFloat = rect.maxY - strokeWidth
//        let xPos: CGFloat = 0
//        let width: CGFloat = rect.width - xPos
//        let strokeColor: UIColor = .text(.primary)
//        
//        context.setStrokeColor(strokeColor.cgColor)
//        context.setLineWidth(strokeWidth)
//        context.move(to: CGPoint(x: xPos, y: yPos))
//        context.addLine(to: CGPoint(x: xPos + width, y: yPos))
//        context.strokePath()
    }
}
