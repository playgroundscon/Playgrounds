//
//  ScheduleDay.swift
//  Playgrounds
//
//  Created by Andyy Hope on 18/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import Foundation
import SwiftyJSON

public protocol RequestTestable : Requestable {
    static func test(resource: RequestResource, log: Bool, function: String, file: String, completion: @escaping RequestResponse<JSON>.Completion)
}

public extension RequestTestable {
    
    public static func test(resource: RequestResource, log: Bool = false, function: String = #function, file: String = #file, completion: @escaping RequestResponse<JSON>.Completion) {
        if log {
            print(file)
            print(function)
            print(resource.path)
        }
        
        
        if let url = Bundle.main.url(forResource: resource.filename, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url, options: .mappedIfSafe)
                parseRequest(data: data, response: nil, log: log, completion: completion)
            }
            catch let error as NSError {
                print(error)
                print(file)
                
                completion(.fail(.invalidData(error)))
            }
        }
        else {
            completion(.fail(.failedInitializer))
        }
        
    }
}
