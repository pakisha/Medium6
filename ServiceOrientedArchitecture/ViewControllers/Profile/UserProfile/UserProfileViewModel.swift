//
//  UserProfileViewModel.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/26/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit

protocol UserProfileViewModelProtocol {
    var user: Dynamic<UserProfile.User?> { get set }
    
    func updateProfile(params: [String: Any])
}

class UserProfileViewModel: BaseViewModel, UserProfileViewModelProtocol {
    
    // MARK: - UserProfileViewModelProtocol
    
    var user: Dynamic<UserProfile.User?>
    
    // MARK: - Vars & Lets
    
    private let userNetworkServices: UserNetworkServices
    private let userServices: UserServices
    
    // MARK: - Public methods
    
    func updateProfile(params: [String: Any]) {
        self.isLoaderHidden.value = false
        self.userNetworkServices.updateProfile(params: params) { (user, alertMessage) in
            self.isLoaderHidden.value = true
            if let user = user {
                self.user.value = user
                self.alertMessage.value = AlertMessage(title: "Success", body: "User updated")
            } else {
                self.alertMessage.value = alertMessage!
            }
        }
    }
    
    // MARK: - Private methods
    
    private func getUser() {
        self.isLoaderHidden.value = false
        self.userNetworkServices.getProfile { (user, alertMessage) in
            self.isLoaderHidden.value = true
            if let user = user {
                self.user.value = user
            } else {
                self.alertMessage.value = alertMessage!
            }
        }
    }
    
    // MARK: - Init
    
    init(userNetworkServices: UserNetworkServices, userServices: UserServices) {
        self.userNetworkServices = userNetworkServices
        self.userServices = userServices
        self.user = Dynamic<UserProfile.User?>(userServices.user)
        super.init()
        self.getUser()
    }
    
}
