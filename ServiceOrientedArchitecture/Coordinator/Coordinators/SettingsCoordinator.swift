//
//  SettingsCoordinator.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/26/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import Foundation

protocol SettingsCoordinatorProtocol {
    var logout: (() -> Void)? { get set }
}

final class SettingsCoordinator: BaseCoordinator, CoordinatorFinishOutput, SettingsCoordinatorProtocol {
    
    // MARK: - SettingsCoordinatorProtocol
    
    var logout: (() -> Void)?
    
    // MARK: - CoordinatorFinishOutput
    
    var finishFlow: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    private let router: RouterProtocol
    private let factory: Factory
    
    // MARK: - Private methods
    
    private func showSettingsOptionsViewController() {
        let settingOptionsViewController = self.factory.instantiateSettingsOptionsViewController()
        settingOptionsViewController.onBack = { [unowned self] in
            self.router.popModule()
            self.finishFlow?()
        }
        settingOptionsViewController.onLogout = { [unowned self] in
            self.logout?()
        }
        self.router.push(settingOptionsViewController)
    }
    
    // MARK: - Coordinator
    
    override func start() {
        self.showSettingsOptionsViewController()
    }
    
    // MARK: - Init
    
    init(router: RouterProtocol, factory: Factory) {
        self.router = router
        self.factory = factory
    }
    
}
