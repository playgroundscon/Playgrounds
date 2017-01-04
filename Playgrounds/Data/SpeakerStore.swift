//
//  SpeakerStore.swift
//  Playgrounds
//
//  Created by Andyy Hope on 19/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import Foundation

fileprivate extension UserDefaults {
    
    struct Speaker: ObjectUserDefaultable {
        
        enum ObjectDefaultKey: String {
            case speakers
        }
    }
}

struct SpeakerStore {
    
    static func store(_ speakers: [Speaker]) {
        let data = NSKeyedArchiver.archivedData(withRootObject: speakers)
        UserDefaults.Speaker.set(data, forKey: .speakers)
    }
    
    static var speakers: [Speaker] {
        if  let data = UserDefaults.Speaker.object(forKey: .speakers) as? Data,
            let speakers = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Speaker] {
            
            return speakers.sorted { $0.0.name < $0.1.name }
        }
        else {
            return []
        }
    }
}
