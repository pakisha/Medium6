//
//  LaunchInstructor.swift
//  iOSStyleguide
//
//  Created by Pavle Pesic on 3/14/18.
//  Copyright © 2018 Fabrika. All rights reserved.
//

import Foundation

enum LaunchInstructor {
    
    case main
    case auth
    case onboarding
    
    // MARK: - Public methods
    
    static func configure(isAutorized: Bool = false, tutorialWasShown: Bool = false) -> LaunchInstructor {
        
        let isAutorized = isAutorized
        let tutorialWasShown = tutorialWasShown
        
//        if AuthUserDefaultsServices.shared().getToken() != nil {
//            isAutorized = true
//            tutorialWasShown = true
//        }
        
        switch (tutorialWasShown, isAutorized) {
            case (true, false), (false, false): return .auth
            case (false, true): return .onboarding
            case (true, true): return .main
        }
    }
}
