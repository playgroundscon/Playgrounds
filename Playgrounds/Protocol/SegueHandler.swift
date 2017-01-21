//
//  SegueHandler.swift
//  SegueHandlerProtocolTest
//
//  Created by Andyy Hope on 4/01/2016.
//  Copyright © 2016 Punters. All rights reserved.
//

import UIKit

public protocol SegueHandler {
    
    associatedtype Segue: RawRepresentable
}

public extension SegueHandler where Self: UIViewController, Segue.RawValue == String {
    
    public func performSegue(_ segue: Segue, sender: Any?) {
        performSegue(withIdentifier: segue.rawValue, sender: sender)
    }
    
    
    public func segueIdentifier(for segue: UIStoryboardSegue) -> Segue {
        guard  let identifier = segue.identifier,
            let segueIdentifier = Segue(rawValue: identifier) else { fatalError("\n\nCouldn't handle segue identifier '\(segue.identifier)' for view controller of type '\(Self.self)'.") }
        
        return segueIdentifier
    }
}
