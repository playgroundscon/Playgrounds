//
//  ScheduleSession.swift
//  Playgrounds
//
//  Created by Andyy Hope on 18/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ScheduleSession {
    
    let time: ScheduleTime
    let speaker: Speaker
    let presentation: Presentation
    
    init(time: ScheduleTime) {
        self.time = time
        self.speaker = Speaker()
        self.presentation = Presentation()
    }
    
    init?(json: JSON) {
        guard
            let interval = json["time"].double,
            let time = ScheduleTime(date: Date(timeIntervalSince1970: interval)),
            let presentation = Presentation(json: json["presentation"]),
            let speaker = Speaker(json: json["speaker"])
            else { return nil }
        
        self.time = time
        self.speaker = speaker
        self.presentation = presentation
    }
}
