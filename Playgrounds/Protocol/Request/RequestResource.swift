//
//  ScheduleDay.swift
//  Playgrounds
//
//  Created by Andyy Hope on 18/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import Foundation

public struct RequestResource {
    private let type: String = "json"
    
    public let filename: String
    public let bundle: Bundle
    
    public init(filename: String, bundle: Bundle = Bundle.main) {
        self.filename = filename
        self.bundle = bundle
    }
    
    public var path: String {
        if let path = bundle.path(forResource: filename, ofType: type) {
            return path
        }
        else {
            assertionFailure("No file exists in the project named: \(filename)")
            return ""
        }
    }
}
