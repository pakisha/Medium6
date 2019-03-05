//
//  UserNetworkServices.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/22/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import Foundation

class UserNetworkServices {
    
    // MARK: - Vars & Lets
    
    private let apiManager: APIManager
    private let userServices: UserServices
    
    // MARK: - Public methods
    
    func getProfile(handler: @escaping (_ profile: UserProfile.User?, _ message: AlertMessage?)->()) {
        self.apiManager.call(type: RequestItemsType.getUser) { (profile: UserProfile.User?, message: AlertMessage?) in
            if let profile = profile {
                self.userServices.user = profile
                handler(profile, nil)
            } else {
                handler(nil, message!)
            }
        }
    }
    
    func updateProfile(params: [String: Any], handler: @escaping (_ profile: UserProfile.User?, _ message: AlertMessage?)->()) {
        self.apiManager.call(type: RequestItemsType.updateUser, params: params) { (profile: UserProfile.User?, message: AlertMessage?) in
            if let profile = profile {
                self.userServices.user = profile
                handler(profile, nil)
            } else {
                handler(nil, message!)
            }
        }
    }
    
    // MARK: - Initialization
    
    init(apiManager: APIManager, userServices: UserServices) {
        self.apiManager = apiManager
        self.userServices = userServices
    }
    
}
