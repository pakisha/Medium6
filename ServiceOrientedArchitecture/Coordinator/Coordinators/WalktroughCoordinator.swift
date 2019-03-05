//
//  WalktroughCoordinator.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/22/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import Foundation

final class WalktroughCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
    // MARK: - CoordinatorFinishOutput
    
    var finishFlow: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    private let router: RouterProtocol
    private let factory: Factory
    
    // MARK: - Private metods
    
    private func showWalktroughViewController() {
        let walktroughViewController = self.factory.instantiateWalktroughViewController()
        walktroughViewController.onFinishWalktrough = { [unowned self] in
            self.finishFlow?()
        }
        self.router.push(walktroughViewController)
    }
    
    // MARK: - Coordinator
    
    override func start() {
        self.showWalktroughViewController()
    }
    
    // MARK: - Init
    
    init(router: RouterProtocol, factory: Factory) {
        self.router = router
        self.factory = factory
    }
    
}
