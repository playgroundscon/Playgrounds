//
//  SpeakerCell.swift
//  Playgrounds
//
//  Created by Andyy Hope on 19/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit

final class SpeakerCell: TableViewCell, NibLoadable {

    // MARK: - IBOutlets
    
    @IBOutlet weak var headingLabel: UILabel! { didSet {
        headingLabel.textColor = .text(.heading)
        }
    }
    
    @IBOutlet weak var subheadingLabel: UILabel! { didSet {
        subheadingLabel.textColor = .text(.subheading)
        }
    }
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension SpeakerCell: DefaultableHeight {
    
    static var defaultHeight: CGFloat {
        return 64
    }
}
