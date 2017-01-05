//
//  DetailLinksCell.swift
//  Playgrounds
//
//  Created by Andyy Hope on 19/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit

final class DetailLinksCell: TableViewCell, NibLoadable {

    @IBOutlet weak var iconImageView: UIImageView! { didSet {
        iconImageView.backgroundColor = .gray
        }
    }
    
    @IBOutlet weak var headingLabel: UILabel! { didSet {
        headingLabel.textColor = .text(.heading)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension DetailLinksCell: DefaultableHeight {
    
    static var defaultHeight: CGFloat {
        return 44.0
    }
}
