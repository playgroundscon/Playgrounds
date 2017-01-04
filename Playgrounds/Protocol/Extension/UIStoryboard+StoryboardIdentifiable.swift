//
//  UIStoryboard+StoryboardIdentifier.swift
//  PULibrary
//
//  Created by Andyy Hope on 11/01/2016.
//  Copyright © 2016 Punters. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    public func instantiateInitialViewController<T: UIViewController>() -> T where T: StoryboardIdentifiable {
        let optionalViewController = instantiateInitialViewController()
        
        if let viewController = optionalViewController as? T {
            return viewController
        }
        else {
            fatalError("Couldn’t instantiate initial view controller as \(T.storyboardIdentifier)")
        }
    }
    
    public func instantiateViewController<T: UIViewController>() -> T where T: StoryboardIdentifiable {
        let optionalViewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier)
        
        if let viewController = optionalViewController as? T {
            return viewController
        }
        else {
            fatalError("Couldn’t instantiate view controller with identifier \(T.storyboardIdentifier)")
        }
    }
}
