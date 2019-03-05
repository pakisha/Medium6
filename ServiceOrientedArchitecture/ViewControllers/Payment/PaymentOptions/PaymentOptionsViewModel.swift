//
//  PaymentOptionsViewModel.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/26/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit

protocol PaymentOptionsViewModelProtocol {
    
}

class PaymentOptionsViewModel: NSObject, PaymentOptionsViewModelProtocol {
    
    // MARK: - Vars & Lets
    
    private let userServices: UserServices
    
    // MARK: - Init
    
    init(userServices: UserServices) {
        self.userServices = userServices
        super.init()
    }
    
}
