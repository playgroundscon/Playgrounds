//
//  AppDelegate.swift
//  Playgrounds
//
//  Created by Andyy Hope on 18/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        AppearanceController.prepareInterfaceTheme()
        
        UIApplication.shared.isStatusBarHidden = false
        UIApplication.shared.statusBarStyle = .default
        return true
    }
}
