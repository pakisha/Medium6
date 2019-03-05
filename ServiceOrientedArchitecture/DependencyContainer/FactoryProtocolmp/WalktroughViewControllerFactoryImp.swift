//
//  WalktroughViewControllerFactoryImp.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/26/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import UIKit

extension DependencyContainer: WalktroughViewControllerFactory {

    func instantiateWalktroughViewController() -> WalktroughViewController {
        let walktroughViewController = UIStoryboard.walktrough.instantiateViewController(withIdentifier: "WalktroughViewController") as! WalktroughViewController
        walktroughViewController.viewModel = WalktroughViewModel()
        return walktroughViewController
    }
    
}
