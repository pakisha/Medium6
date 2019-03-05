//
//  AppDelegate.swift
//  ServiceOrientedArchitecture
//
//  Created by Pavle Pesic on 1/30/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Vars & Lets
    
    var window: UIWindow?
    var rootController: UINavigationController {
        return self.window!.rootViewController as! UINavigationController
    }
    private lazy var dependencyConatiner = DependencyContainer(rootController: self.rootController)
    
    // MARK: - Application lifecycle
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.dependencyConatiner.start()
        // Override point for customization after application launch.
        return true
    }


}

