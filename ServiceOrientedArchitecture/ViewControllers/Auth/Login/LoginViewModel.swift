//
//  LoginViewModel.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/19/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit

protocol LoginViewModelProtocol {
    
}

class LoginViewModel: NSObject, LoginViewModelProtocol {
    
    // MARK: - Vars & lets
    
    private let authServices: AuthNetworkServices
    
    // MARK: - Init
    
    init(authServices: AuthNetworkServices) {
        self.authServices = authServices
        super.init()
    }
    
}
