//
//  ProfileCoordinator.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/26/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import Foundation

import Foundation

final class ProfileCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
    // MARK: - CoordinatorFinishOutput
    
    var finishFlow: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    private let router: RouterProtocol
    private let factory: Factory
    
    // MARK: - Private methods
    
    private func showUserProfileViewController() {
        let profileViewController = self.factory.instantiateUserProfileViewController()
        profileViewController.onBack = { [unowned self] in
            self.router.popModule(transition: FadeAnimator(animationDuration: 0.5, isPresenting: false))
            self.finishFlow?()
        }
        profileViewController.onBecomeAMember = { [unowned self] in
            self.presentBecomeAMemberViewController()
        }
        self.router.push(profileViewController, transition: FadeAnimator(animationDuration: 0.5, isPresenting: true))
    }
    
    private func presentBecomeAMemberViewController() {
        let becomeAMemberViewController = self.factory.instantiateBecomeAMemberViewController()
        becomeAMemberViewController.onClose = { [unowned self] in
            self.router.dismissModule()
        }
        self.router.present(becomeAMemberViewController, animated: true, modalPresentationSytle: .overCurrentContext)
    }
    
    // MARK: - Coordinator
    
    override func start() {
        self.showUserProfileViewController()
    }
    
    // MARK: - Init
    
    init(router: RouterProtocol, factory: Factory) {
        self.router = router
        self.factory = factory
    }
    
}
