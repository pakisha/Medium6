//
//  PaymentCoordinator.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/26/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import Foundation

final class PaymentCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
    // MARK: - CoordinatorFinishOutput
    
    var finishFlow: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    private let router: RouterProtocol
    private let factory: Factory
    
    // MARK: - Private methods
    
    private func showPaymentOptionsViewController() {
        let paymentOptionsViewController = self.factory.instantiatePaymentOptionsViewController()
        paymentOptionsViewController.onBack = { [unowned self] in
            self.router.popModule()
            self.finishFlow?()
        }
        paymentOptionsViewController.onAddPaymentOption = { [unowned self] in
            self.showAddPaymentOptionViewController()
        }
        self.router.push(paymentOptionsViewController)
    }
    
    private func showAddPaymentOptionViewController() {
        let addPaymentOptionViewController = self.factory.instantiateAddPaymentOptionViewController()
        addPaymentOptionViewController.onBack = { [unowned self] in
            self.router.popModule()
        }
        self.router.push(addPaymentOptionViewController)
    }
    
    // MARK: - Coordinator
    
    override func start() {
        self.showPaymentOptionsViewController()
    }
    
    // MARK: - Init
    
    init(router: RouterProtocol, factory: Factory) {
        self.router = router
        self.factory = factory
    }
    
}
