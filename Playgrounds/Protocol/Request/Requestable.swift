//
//  ScheduleDay.swift
//  Playgrounds
//
//  Created by Andyy Hope on 18/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import Foundation
import SwiftyJSON

public typealias Parameters = [String : AnyObject]

public protocol Requestable {
    static func request(url: URL, parameters: Parameters?, log: Bool, function: String, file: String, completion: @escaping RequestResponse<JSON>.Completion)
}

public extension Requestable {
    
    // MARK: - Requester
    
    public static func request(url: URL, parameters: Parameters? = nil, log: Bool = false, function: String = #function, file: String = #file, completion: @escaping RequestResponse<JSON>.Completion) {
        
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpBody = httpBody(for: parameters)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        session.dataTask(with: request) { (data, response, error) in
            
            if log {
                print(file)
                print(function)
                print(url)
                if let parameters = parameters { print(parameters) }
            }
            
            if let error = error {
                print(error)
                print(file)
                print(url)
                
                completion(.fail(.session(error as NSError)))
            }
            else if let data = data {
                self.parseRequest(data: data, response: response, log: log, completion: completion)
            }
        }
        .resume()
    }
    
    
    // MARK: - Parser
    
    internal static func parseRequest(data: Data, response: URLResponse?, log: Bool, completion: @escaping RequestResponse<JSON>.Completion) {
        
        var error: NSError?
        let json = JSON(data: data, options: .mutableLeaves, error: &error)
        
        DispatchQueue.main.async {
            if let error = error {
                completion(.fail(.invalidData(error)))
            }
            else {
                if log { print(json) }
                
                completion(.success(json))
            }
        }
    }
    
    
    // MARK: - Parameter Utilities
    
    private static func httpBody(for parameters: Parameters?) -> Data? {
        guard let parameters = parameters else { return nil }
        
        do {
            let httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            return httpBody
        }
        catch let error as NSError {
            print(error)
            assertionFailure()
            return nil
        }
        catch let data as Data {
            return data
        }
    }
}
