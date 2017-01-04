//
//  DetailTextCell.swift
//  Playgrounds
//
//  Created by Andyy Hope on 19/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit

final class DetailTextCell: TableViewCell, NibLoadable {

    @IBOutlet weak var descriptionTextLabel: UILabel! { didSet {
        descriptionTextLabel.text = nil
        descriptionTextLabel.numberOfLines = 0
        descriptionTextLabel.textColor = .text(.body)
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}
