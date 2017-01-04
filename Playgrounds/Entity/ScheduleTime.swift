//
//  ScheduleTime.swift
//  Playgrounds
//
//  Created by Andyy Hope on 18/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import Foundation

enum ScheduleTime: Int {
    case nine
    case nineThirty
    case ten
    case tenThirty
    case eleven
    case elevenThirty
    case twelve
    case twelveThirty
    case one
    case oneThirty
    case two
    case twoThirty
    case three
    case threeThirty
    case four
    case fourThirty
    case five
    case fiveThirty
    case six
    
    static let count: Int = 18
    
    init?(date: Date) {
        self = .nine
    }
}
