//
//  AddPaymentOptionViewModel.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/29/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit

protocol AddPaymentOptionViewModelProtocol {
    func updateProfile(params: [String: Any])
}

class AddPaymentOptionViewModel: BaseViewModel, AddPaymentOptionViewModelProtocol {
    
    // MARK: - Vars & Lets
    
    private let userNetworkServices: UserNetworkServices
    
    // MARK: - Public methods
    
    func updateProfile(params: [String: Any]) {
        self.isLoaderHidden.value = false
        self.userNetworkServices.updateProfile(params: params) { (user, alertMessage) in
            self.isLoaderHidden.value = true
            if user != nil {
                self.alertMessage.value = AlertMessage(title: "Success", body: "User updated")
            } else {
                self.alertMessage.value = alertMessage!
            }
        }
    }
    
    // MARK: - Init
    
    init(userNetworkServices: UserNetworkServices) {
        self.userNetworkServices = userNetworkServices
        super.init()
    }
    
}
