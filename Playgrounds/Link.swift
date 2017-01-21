//
//  Link.swift
//  Playgrounds
//
//  Created by Bas Broek on 21/01/2017.
//  Copyright © 2017 Andyy Hope. All rights reserved.
//

import Foundation
import SwiftyJSON

final class Link: NSObject, NSCoding {
    
    fileprivate enum Key {
        static let type = "type"
        static let label = "label"
        static let url = "url"
    }
    
    init(type: Type, label: String, url: URL) {
        self.type = type
        self.label = label
        self.url = url
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(type.rawValue, forKey: Key.type)
        aCoder.encode(label, forKey: Key.label)
        aCoder.encode(url.absoluteString, forKey: Key.url)
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        guard
            let typeValue = aDecoder.decodeObject(forKey: Key.type) as? String,
            let type = Type(rawValue: typeValue),
            let label = aDecoder.decodeObject(forKey: Key.label) as? String,
            let urlString = aDecoder.decodeObject(forKey: Key.url) as? String,
            let url = URL(string: urlString)
            else { fatalError("Could not decode object `Link`.") }
        
        self.init(type: type, label: label, url: url)
    }
    
    enum `Type`: String {
        case twitter, website
    }
    
    let type: Type
    let label: String
    let url: URL
    
    init?(json: JSON) {
        guard
            let type = Type(rawValue: json["type"].stringValue),
            let label = json["label"].string,
            let url = URL(string: json["link"].stringValue)
            else { return nil }
        
        self.type = type
        self.label = label
        self.url = url
    }
}
