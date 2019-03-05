//
//  UserProfileModels.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/26/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit

enum UserProfile {
    
    class User: Codable {
        
        let fullName: String
        let email: String
        let isPrimeUser: Bool
        let paymentMethods: [String]
        
    }
    
}
