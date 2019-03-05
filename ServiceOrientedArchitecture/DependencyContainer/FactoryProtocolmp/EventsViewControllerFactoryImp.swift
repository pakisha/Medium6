//
//  EventsViewControllerFactoryImp.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/26/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import UIKit

extension DependencyContainer: EventsViewControllerFactory {
    
    func instantiateEventsListViewController() -> EventsListViewController {
        let eventsListViewController = UIStoryboard.events.instantiateViewController(withIdentifier: "EventsListViewController") as! EventsListViewController
        eventsListViewController.viewModel = EventsListViewModel(eventNetworkServices: self.eventNetworkServices)
        return eventsListViewController
    }
    
    func instantiateEventDetailsViewController(event: EventsList.Event) -> EventDetailsViewController {
        let eventDetailsViewController = UIStoryboard.events.instantiateViewController(withIdentifier: "EventDetailsViewController") as! EventDetailsViewController
        eventDetailsViewController.viewModel = EventDetailsViewModel(event: event)
        return eventDetailsViewController
    }
    
}
