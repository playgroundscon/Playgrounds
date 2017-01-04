//
//  SectionLabel.swift
//  Playgrounds
//
//  Created by Andyy Hope on 20/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit

final class SectionLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func drawText(in rect: CGRect) {
        
        let insets = UIEdgeInsets(top: 8, left: 16, bottom: 0, right: 0)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    private func style() {
        font = UIFont.systemFont(ofSize: 12)
        textColor = .gray
        backgroundColor = .interface(.foreground)
    }
}
