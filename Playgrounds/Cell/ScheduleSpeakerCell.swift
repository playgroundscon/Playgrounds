//
//  ScheduleSpeakerCell.swift
//  Playgrounds
//
//  Created by Andyy Hope on 18/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit

final class ScheduleSpeakerCell: TableViewCell, NibLoadable {

    // MARK: - IBOutlets
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var headingLabel: UILabel! { didSet {
        headingLabel.numberOfLines = 0
        headingLabel.textColor = .text(.heading)
        }
    }
    
    @IBOutlet weak var subheadingLabel: UILabel! { didSet {
        subheadingLabel.textColor = .text(.subheading)
        }
    }
    
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.circular()
    }
}

extension ScheduleSpeakerCell: DefaultableHeight {
    
    static var defaultHeight: CGFloat {
        return 64
    }
}
