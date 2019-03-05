//
//  SettingsViewControllerFactoryImp.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/26/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import UIKit

extension DependencyContainer: SettingsViewControllerFactory {

    func instantiateSettingsOptionsViewController() -> SettingsOptionsViewController {
        let settingOptionsViewController = UIStoryboard.settings.instantiateViewController(withIdentifier: "SettingsOptionsViewController") as! SettingsOptionsViewController
        settingOptionsViewController.viewModel = SettingsOptionsViewModel()
        return settingOptionsViewController
    }
    
}
