//
//  UIColor+Utilities.swift
//  Playgrounds
//
//  Created by Andyy Hope on 19/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit

extension UIColor {
    
    enum Playgrounds {
        case primary, secondary
    }
    
    static func playgrounds(_ playgrounds: Playgrounds) -> UIColor {
        switch playgrounds {
        case .primary:
            return .white //UIColor(red: 6/255, green: 63/255, blue: 137/255, alpha: 1)
            
        case .secondary:
            return UIColor(red: 23/255, green: 23/255, blue: 23/255, alpha: 1)
        }
    }
    
    enum Text {
        case primary, secondary, heading, subheading, body
    }
    
    static func text(_ text: Text) -> UIColor {
        switch text {
        case .primary:
            return UIColor(red: 6/255, green: 63/255, blue: 137/255, alpha: 1)//.white
            
        case .secondary:
            return UIColor(red: 116/255, green: 116/255, blue: 116/255, alpha: 1)
            
        case .heading:
            return .black
            
        case .subheading:
            return .darkGray
            
        case .body:
            return .black
        }
    }
    
    enum Interface {
        case background, foreground
    }
    
    static func interface(_ interface: Interface) -> UIColor {
        switch interface {
        case .background:
            return UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
            
        case .foreground:
            return .white
        }
    }
}
