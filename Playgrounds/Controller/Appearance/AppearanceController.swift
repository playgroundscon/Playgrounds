//
//  AppearanceController.swift
//  Playgrounds
//
//  Created by Andyy Hope on 19/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit

struct AppearanceController {
    
    static func prepareInterfaceTheme() {
        
        // Navigation
        
        var navigationBar: UINavigationBar {
            return UINavigationBar.appearance()
        }
        
        navigationBar.setBackgroundImage(UIImage(named: "WhiteBackground")!, for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.tintColor = .text(.primary)
        navigationBar.barTintColor = .playgrounds(.primary)
        navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName : UIColor.text(.primary)]
        
        // Tab Bar
        
        var tabBar: UITabBar {
            return UITabBar.appearance()
        }
        
        tabBar.tintColor = .text(.primary)
        tabBar.unselectedItemTintColor = .text(.secondary)
        tabBar.barTintColor = .playgrounds(.secondary)
        
        // Tab Bar Item
        
        var tabBarItem: UITabBarItem {
            return UITabBarItem.appearance()
        }
    }
}
