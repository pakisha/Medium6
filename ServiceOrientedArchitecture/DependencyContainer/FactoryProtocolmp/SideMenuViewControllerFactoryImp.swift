//
//  SideMenuViewControllerFactoryImp.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/22/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import UIKit

extension DependencyContainer: SideMenuViewControllerFactory {
    
    func instantiateSideMenuViewController() -> SideMenuViewController {
        let sideMenuViewController = UIStoryboard.sideMenu.instantiateViewController(withIdentifier: "SideMenuViewController") as! SideMenuViewController
        sideMenuViewController.viewModel = SideMenuViewModel(userNetworkServices: self.userNetworkServices)
        return sideMenuViewController
    }
    
}
