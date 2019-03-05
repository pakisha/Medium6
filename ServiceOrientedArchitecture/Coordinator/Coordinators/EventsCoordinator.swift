//
//  EventsCoordinator.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/26/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import Foundation

final class EventsCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
    // MARK: - CoordinatorFinishOutput
    
    var finishFlow: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    private let router: RouterProtocol
    private let factory: Factory
    
    // MARK: - Private methods
    
    private func showEventsListViewController() {
        let eventsListViewController = self.factory.instantiateEventsListViewController()
        eventsListViewController.onBack = { [unowned self] in
            self.router.popModule()
            self.finishFlow?()
        }
        eventsListViewController.onEventDetails = { [unowned self] in
            self.showEventDetailsViewController(event: $0)
        }
        self.router.push(eventsListViewController)
    }
    
    private func showEventDetailsViewController(event: EventsList.Event) {
        let eventDetailsViewController = self.factory.instantiateEventDetailsViewController(event: event)
        eventDetailsViewController.onBack = { [unowned self] in
            self.router.popModule()
        }
        eventDetailsViewController.onBuyTickets = { [unowned self] in
            self.runPaymentFlow()
        }
        self.router.push(eventDetailsViewController)
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
        self.showEventsListViewController()
    }
    
    // MARK: - Init
    
    init(router: RouterProtocol, factory: Factory) {
        self.router = router
        self.factory = factory
    }

}
