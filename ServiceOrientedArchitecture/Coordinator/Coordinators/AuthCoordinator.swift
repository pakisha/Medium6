//
//  AuthCoordinator.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/18/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import Foundation

final class AuthCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
    // MARK: - CoordinatorFinishOutput
    
    var finishFlow: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    private let router: RouterProtocol
    private let factory: Factory
    
    // MARK: - Private methods
    
    private func showLoginRegisterViewController() {
        let showLoginRegisterViewController = self.factory.instantiateChooseLoginRegisterViewController()
        showLoginRegisterViewController.onRegister = { [unowned self] in
            self.showRegisterViewController()
        }
        showLoginRegisterViewController.onLogin = { [unowned self] in
            self.showLoginViewController()
        }
        self.router.setRootModule(showLoginRegisterViewController, hideBar: true)
    }
    
    private func showLoginViewController() {
        let loginViewController = self.factory.instantiateLoginViewController()
        loginViewController.onBack = { [unowned self] in
            self.router.popModule()
        }
        loginViewController.onLogin = {
            self.finishFlow?()
        }
        self.router.push(loginViewController)
    }
    
    private func showRegisterViewController() {
        let registerViewController = self.factory.instantiateRegisterViewController()
        registerViewController.onBack = { [unowned self] in
            self.router.popModule()
        }
        registerViewController.onRegister = {
            self.finishFlow?()
        }
        self.router.push(registerViewController)
    }
    
    // MARK: - Coordinator
    
    override func start() {
        self.showLoginRegisterViewController()
    }
    
    // MARK: - Init
    
    init(router: RouterProtocol, factory: Factory) {
        self.router = router
        self.factory = factory
    }
    
}
