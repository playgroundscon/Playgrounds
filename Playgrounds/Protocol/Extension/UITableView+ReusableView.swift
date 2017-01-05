//
//  UITableView+Cell.swift
//  SegueHandlerProtocolTest
//
//  Created by Andyy Hope on 4/01/2016.
//  Copyright © 2016 Punters. All rights reserved.
//

import UIKit

public extension UITableView {
    
    // MARK: - Register Cell Class
    
    public func register<T: UITableViewCell>(_: T.Type) where T: ReusableView {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    // MARK: - Register Cell Class with Nib
    
    public func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadable {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    // MARK: - Register Header Footer Class
    
    public func register<T: UITableViewHeaderFooterView>(_: T.Type) where T: ReusableView {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    // MARK: - Register Header Footer Class with Nib
    
    public func register<T: UITableViewHeaderFooterView>(_: T.Type) where T: ReusableView, T: NibLoadable {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    // MARK: - Deqeueing Cell
    
    public func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else { fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)") }
        
        return cell
    }
    
    public func dequeueReusableHeaderFooter<T: UITableViewHeaderFooterView>() -> T where T: ReusableView {
        guard let headerFooter = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else { fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)") }
        
        return headerFooter
    }
}
