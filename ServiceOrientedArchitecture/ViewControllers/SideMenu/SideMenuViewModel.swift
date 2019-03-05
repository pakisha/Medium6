//
//  SideMenuViewModel.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/22/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit

protocol SideMenuViewModelProtocol {
    
}

class SideMenuViewModel: NSObject, SideMenuViewModelProtocol {
    
    // MARK: - Vars & Lets
    
    private let userNetworkServices: UserNetworkServices
    
    // MARK: - Init
    
    init(userNetworkServices: UserNetworkServices) {
        self.userNetworkServices = userNetworkServices
        super.init()
    }
    
}
