//
//  ScheduleDay.swift
//  Playgrounds
//
//  Created by Andyy Hope on 18/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import Foundation

public enum RequestResponse<T> {
    public typealias Completion = (_ result: RequestResponse<T>) -> Void
    
    case success(T)
    case fail(RequestError)
}

public enum RequestStatus {
    public typealias Completion = (_ result: RequestStatus) -> Void
    
    case success
    case fail(RequestError)
}
