//
//  UICollectionView+ReusableView.swift
//  SegueHandlerProtocolTest
//
//  Created by Andyy Hope on 4/01/2016.
//  Copyright © 2016 Punters. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    // MARK: - Register Cell Class
    
    public func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    // MARK: - Register Cell Class with Nib
    
    public func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView, T: NibLoadable {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    
    // MARK: - Deqeueing Cell
    
    public func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else { fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)") }
        
        return cell
    }
}
