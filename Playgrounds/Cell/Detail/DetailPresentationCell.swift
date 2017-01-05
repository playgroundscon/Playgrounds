//
//  DetailPresentationCell.swift
//  Playgrounds
//
//  Created by Andyy Hope on 19/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit

final class DetailPresentationCell: TableViewCell, NibLoadable {

    @IBOutlet weak var headingLabel: UILabel! { didSet {
        headingLabel.numberOfLines = 0
        headingLabel.textColor = .text(.heading)
        }
    }
    @IBOutlet weak var bodyLabel: UILabel! { didSet {
        bodyLabel.numberOfLines = 0
        bodyLabel.textColor = .text(.body)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

extension DetailPresentationCell: DefaultableHeight {
    
    static var defaultHeight: CGFloat {
        return 88.0
    }
}
