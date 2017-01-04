//
//  NibLoadable.swift
//  PULibrary
//
//  Created by Andyy Hope on 4/01/2016.
//  Copyright © 2016 Punters. All rights reserved.
//

import UIKit

public protocol NibLoadable: class {

    // MARK: - Provided

    static var nibName: String { get }
}

public extension NibLoadable {

    static var nibName: String {
        return String(describing: self)
    }
}

public extension NibLoadable where Self: UIViewController {

    @available(*, deprecated, message: "Use .nibInstance() instead")
    static func loadFromNib<T>() -> T {
        
        let bundle = Bundle(for: object_getClass(self))
        
        if let loadedViewController = self.init(nibName: nibName, bundle: bundle) as? T {
            return loadedViewController
        }
        else {
            fatalError("Could not load the view controller from nib. Is your bundle accessible?", file: #file)
        }
    }
    
    static func nibInstance() -> Self {
        
        let bundle = Bundle(for: object_getClass(Self.self))
        
        if let loadedViewController = UIViewController(nibName: nibName, bundle: bundle) as? Self {
            return loadedViewController
        }
        else {
            fatalError("Could not load the view controller from nib. Is your bundle accessible?", file: #file)
        }
    }
}

public extension NibLoadable where Self: UIView {
    
    @available(*, deprecated, message: "Use .nibInstance() instead")
    static func loadFromNib<T>() -> T {
        
        let bundle = Bundle(for: object_getClass(Self.self))
        
        if let loadedView = bundle.loadNibNamed(self.nibName, owner: nil, options: nil)!.first as? T {
            return loadedView
        }
        else {
            fatalError("Could not load the view from nib. Is your bundle accessible? Should you specify an owner or options?", file: #file)
        }
    }
    
    
    static func nibInstance() -> Self {
        
        let bundle = Bundle(for: Self.self)
        
        if let loadedView = bundle.loadNibNamed(Self.nibName, owner: nil, options: nil)?.first as? Self {
            return loadedView
        }
        else {
            fatalError("Could not load the view from nib. Is your bundle accessible? Should you specify an owner or options?", file: #file)
        }
    }
}
