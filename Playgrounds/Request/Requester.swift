//
//  PresentationsRequester.swift
//  Playgrounds
//
//  Created by Andyy Hope on 19/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Requester: Requestable, RequestTestable {
    
    static func requestPresentations(completion: @escaping RequestResponse<[ScheduleSession]>.Completion) {
        
        let resource = RequestResource(filename: "stub")
        
        test(resource: resource) {
            switch $0 {
            case .success(let response):
                self.parsePresentations(response: response, completion: completion)
                
            case .fail:
                break
            }
        }
    }
    
    
    // MARK: - Parse
    
    private static func parsePresentations(response: JSON, completion: @escaping RequestResponse<[ScheduleSession]>.Completion) {
        let sessions = response.arrayValue
            .flatMap { ScheduleSession(json: $0) }
        
        SpeakerStore.store(sessions.map { $0.speaker })

        completion(.success(sessions))
    }
}
