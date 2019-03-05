//
//  SideMenuCoordinator.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/18/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import Foundation

final class SideMenuCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
    // MARK: - CoordinatorFinishOutput
    
    var finishFlow: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    private let router: RouterProtocol
    private let factory: Factory
    
    // MARK: - Private methods
    
    private func showSideMenuViewController() {
        let sideMenuViewController = self.factory.instantiateSideMenuViewController()
        sideMenuViewController.onEvents = { [unowned self] in
            self.runEventsFlow()
        }
        sideMenuViewController.onPayment = { [unowned self] in
            self.runPaymentFlow()
        }
        sideMenuViewController.onProfile = { [unowned self] in
            self.runProfileFlow()
        }
        sideMenuViewController.onSettings = { [unowned self] in
            self.runSettingsFlow()
        }
        
        self.router.setRootModule(sideMenuViewController, hideBar: true)
    }
    
    private func runEventsFlow() {
        let eventCoordinator = self.factory.instantiateEventsCoordinator(router: self.router)
        self.addDependency(eventCoordinator)
        eventCoordinator.finishFlow = { [unowned self, unowned eventCoordinator] in
            self.removeDependency(eventCoordinator)
        }
        eventCoordinator.start()
    }
    
    private func runProfileFlow() {
        let profileCoordinator = self.factory.instantiateProfileCoordinator(router: self.router)
        self.addDependency(profileCoordinator)
        profileCoordinator.finishFlow = { [unowned self, unowned profileCoordinator] in
            self.removeDependency(profileCoordinator)
        }
        profileCoordinator.start()
    }
    
    private func runSettingsFlow() {
        let settingsCoordinator = self.factory.instantiateSettingsCoordinator(router: self.router)
        self.addDependency(settingsCoordinator)
        settingsCoordinator.finishFlow = { [unowned self, unowned settingsCoordinator] in
            self.removeDependency(settingsCoordinator)
        }
        settingsCoordinator.logout = { [unowned self, unowned settingsCoordinator] in
            self.removeDependency(settingsCoordinator)
            self.finishFlow?()
        }
        settingsCoordinator.start()
    }
    
    private func runPaymentFlow() {
        let paymentCoordinator = self.factory.instantiatePaymentCoordinator(router: self.router)
        self.addDependency(paymentCoordinator)
        paymentCoordinator.finishFlow = { [unowned self, unowned paymentCoordinator] in
            self.removeDependency(paymentCoordinator)
        }
        paymentCoordinator.start()
    }
    
    // MARK: - Coordinator
    
    override func start() {
        self.showSideMenuViewController()
    }
    
    // MARK: - Init
    
    init(router: RouterProtocol, factory: Factory) {
        self.router = router
        self.factory = factory
    }
    
}
