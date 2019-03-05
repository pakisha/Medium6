//
//  DependencyContainer.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/18/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import UIKit
import Alamofire

typealias Factory = CoordinatorFactoryProtocol & ViewControllerFactory
typealias ViewControllerFactory = AuthViewControllerFactory & SideMenuViewControllerFactory & WalktroughViewControllerFactory & SettingsViewControllerFactory & ProfileViewControllerFactory & PaymentViewControllerFactory & EventsViewControllerFactory

class DependencyContainer {
    
    // MARK: - Vars & Lets
    
    private var rootController: UINavigationController
    
    // MARK: App Coordinator
    
    internal lazy var aplicationCoordinator = self.instantiateApplicationCoordinator()
    
    // MARK: APi Manager
    
    internal lazy var sessionManager = SessionManager()
    internal lazy var retrier = APIManagerRetrier()
    internal lazy var apiManager = APIManager(sessionManager: self.sessionManager, retrier: self.retrier)
    
    // MARK: Network services
    
    internal lazy var authNetworkServices = AuthNetworkServices(apiManager: self.apiManager)
    internal lazy var eventNetworkServices = EventNetworkServices(apiManager: self.apiManager)
    internal lazy var userNetworkServices = UserNetworkServices(apiManager: self.apiManager, userServices: self.userServices)
    
    // MARK: Cache services
    
    internal lazy var userServices = UserServices()
    
    // MARK: - Public func
    
    func start() {
        self.aplicationCoordinator.start()
    }
    
    // MARK: - Initialization
    init(rootController: UINavigationController) {
        self.rootController = rootController
    }
    
}

// MARK: - Extensions
// MARK: - CoordinatorFactoryProtocol

extension DependencyContainer: CoordinatorFactoryProtocol {
    
    func instantiateApplicationCoordinator() -> ApplicationCoordinator {
        return ApplicationCoordinator(router: Router(rootController: rootController), factory: self as Factory, launchInstructor: LaunchInstructor.configure())
    }
    
    func instantiateAuthCoordinator(router: RouterProtocol) -> AuthCoordinator {
        return AuthCoordinator(router: router, factory: self)
    }
    
    func instantiateEventsCoordinator(router: RouterProtocol) -> EventsCoordinator {
        return EventsCoordinator(router: router, factory: self)
    }
    
    func instantiatePaymentCoordinator(router: RouterProtocol) -> PaymentCoordinator {
        return PaymentCoordinator(router: router, factory: self)
    }
    
    func instantiateProfileCoordinator(router: RouterProtocol) -> ProfileCoordinator {
        return ProfileCoordinator(router: router, factory: self)
    }
    
    func instantiateSettingsCoordinator(router: RouterProtocol) -> SettingsCoordinator {
        return SettingsCoordinator(router: router, factory: self)
    }
    
    func instantiateSideMenuCoordinator(router: RouterProtocol) -> SideMenuCoordinator {
        return SideMenuCoordinator(router: router, factory: self)
    }
    
    func instantiateWalktroughCoordinator(router: RouterProtocol) -> WalktroughCoordinator {
        return WalktroughCoordinator(router: router, factory: self)
    }
    
}
