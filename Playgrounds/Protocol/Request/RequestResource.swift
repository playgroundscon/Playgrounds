//
//  ScheduleDay.swift
//  Playgrounds
//
//  Created by Andyy Hope on 18/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import Foundation

public struct RequestResource {
    private let type = "json"
    
    public let filename: String
    public let bundle: Bundle
    
    public init(filename: String, bundle: Bundle = Bundle.main) {
        self.filename = filename
        self.bundle = bundle
    }
    
    public var path: String {
        guard let path = bundle.path(forResource: filename, ofType: type) else {
            assertionFailure("No file exists in the project named: \(filename)")
            return ""
        }
        
        return path
    }
}
