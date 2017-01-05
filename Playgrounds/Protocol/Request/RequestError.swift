//
//  ScheduleDay.swift
//  Playgrounds
//
//  Created by Andyy Hope on 18/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//
import Foundation

public enum RequestError: Error {
    case failedInitializer
    case session(NSError)
    case invalidData(NSError)
    
    public func log() {
        switch self {
        case .failedInitializer:
            print("API: Failed Initializer")
            let error = NSError(
                    domain: "JSON",
                    code: 1,
                    userInfo: [
                        NSLocalizedDescriptionKey: "One of the keys required in a JSON initializer was missing"])
            print(error)
        
        case .session(let error):
            print("API: Session")
            print(error)
        
        case .invalidData(let error):
            print("API: Invalid Data")
            print(error)
        }
    }
    
    public var title: String {
        return "Oops"
    }
    
    public var message: String {
        return "Something went wrong."
    }
}
