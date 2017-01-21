//
//  Speaker.swift
//  Playgrounds
//
//  Created by Andyy Hope on 18/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import Foundation
import SwiftyJSON

final class Speaker: NSObject, NSCoding {
    
    let name: String
    let location: Location
    let work: String
    let bio: String
    let links: [Link]
    
    var twitter: Link? {
        return links.filter { $0.type == .twitter }.first
    }
    
    var website: Link? {
        return links.filter { $0.type == .website }.first
    }
    
    var resource: String {
        return name.replacingOccurrences(of: " ", with: "")
    }
    
    override init() {
        self.name = "Andyy Hope"
        self.location = .melbourne
        self.work = "Punters"
        self.bio = "Since Andyy first started developing six years ago for iOS 3, he has become the lead iOS developer at Punters in Melbourne, Australia. He's constantly studying the language and finding creative new ways to challenge the norm. You can read about his discoveries at Medium"
        self.links = []
        
        super.init()
    }
    
    init(name: String, location: Location, work: String, bio: String, links: [Link]) {
        self.name = name
        self.location = location
        self.work = work
        self.bio = bio
        self.links = links
    }
    
    init?(json: JSON) {
        guard
            let name = json["name"].string,
            let location = Location(rawValue: json["location"].stringValue),
            let work = json["work"].string,
            let bio = json["bio"].string,
            let links = json["links"].array
            else { return nil }
        
        self.name = name
        self.location = location
        self.work = work
        self.bio = bio
        self.links = links.flatMap { Link(json: $0) }
    }
    
    fileprivate enum Key {
        static let name = "name"
        static let location = "location"
        static let work = "work"
        static let bio = "bio"
        static let links = "links"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: Key.name)
        aCoder.encode(location.rawValue, forKey: Key.location)
        aCoder.encode(bio, forKey: Key.bio)
        aCoder.encode(work, forKey: Key.work)
        aCoder.encode(links, forKey: Key.links)
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        guard
            let name = aDecoder.decodeObject(forKey: Key.name) as? String,
            let work = aDecoder.decodeObject(forKey: Key.work) as? String,
            let bio = aDecoder.decodeObject(forKey: Key.bio) as? String,
            let locationValue = aDecoder.decodeObject(forKey: Key.location) as? String,
            let location = Location(rawValue: locationValue),
            let links = aDecoder.decodeObject(forKey: Key.links) as? [Link]
            else { fatalError("Could not decode object `Speaker`.") }

        self.init(name: name, location: location, work: work, bio: bio, links: links)
    }
}
