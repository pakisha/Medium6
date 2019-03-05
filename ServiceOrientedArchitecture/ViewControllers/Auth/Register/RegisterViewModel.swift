//
//  RegisterViewModel.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/21/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit

protocol RegisterViewModelProtocol {
    
}

class RegisterViewModel: NSObject, RegisterViewModelProtocol {
    
    // MARK: - Vars & lets
    
    private let authServices: AuthNetworkServices
    
    // MARK: - Init
    
    init(authServices: AuthNetworkServices) {
        self.authServices = authServices
        super.init()
    }
    
}
