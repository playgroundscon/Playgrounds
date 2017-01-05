//
//  DetailAvatarCell.swift
//  Playgrounds
//
//  Created by Andyy Hope on 19/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit

final class DetailAvatarCell: TableViewCell, NibLoadable {

    @IBOutlet weak var avatarImageView: UIImageView! { didSet {
        avatarImageView.cornerRadius = 25
        }
        
    }
    @IBOutlet weak var headingLabel: UILabel! { didSet {
        headingLabel.text = nil
        headingLabel.textColor = .text(.heading)
        }
    }
    
    @IBOutlet weak var subheadingLabel: UILabel! { didSet {
        subheadingLabel.text = nil
        subheadingLabel.textColor = .text(.subheading)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}

extension DetailAvatarCell: DefaultableHeight {
    
    static var defaultHeight: CGFloat {
        return 84.0
    }
}
