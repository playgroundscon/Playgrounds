//
//  Presentation.swift
//  Playgrounds
//
//  Created by Andyy Hope on 19/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Presentation {
    
    let title: String
    let blurb: String
    
    init() {
        self.title = "Swift eye for the Stringly typed API"
        self.blurb = "With the upcoming release of the third major version of Swift, massive improvements are coming to the language and we are beginning to see the chains being broken on some of shackles of Objective-C’s legacy.\n\nHowever a lot of these improvements still rely on “Stringly typed” APIs which have the potential to trip us up when developing apps. In this talk we are going to look into how we can avoid using these APIs by replacing them with alternatives that make our code more readable, safer, intentional and Swifty."
    }
    
    init?(json: JSON) {
        guard
            let title = json["title"].string,
            let blurb = json["blurb"].string
            else { return nil }
        
        self.title = title
        self.blurb = blurb
    }
}
