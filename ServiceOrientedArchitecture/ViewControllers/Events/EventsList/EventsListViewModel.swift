//
//  EventsListViewModel.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/26/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit

protocol EventsListViewModelProtocol {
    var events: DynamicArray<EventsList.Event> { get }
    
    func getEvents()
    func numberOfRows() -> Int
    func eventAtIndexPath(indexPath: IndexPath) -> EventsList.Event
}

class EventsListViewModel: BaseViewModel, EventsListViewModelProtocol {
    
    // MARK: - EventsListViewModelProtocol
    
    var events = DynamicArray<EventsList.Event>([])
    
    // MARK: - Vars & Lets
    
    private let eventNetworkServices: EventNetworkServices
    private var currentPage = 1
    private var isFetchingData = false
    
    // MARK: - EventsListViewModelProtocol Methods
    
    func numberOfRows() -> Int {
        return self.events.value.count
    }
    
    func eventAtIndexPath(indexPath: IndexPath) -> EventsList.Event {
        return self.events.value[indexPath.row]
    }
    
    func getEvents() {
        if !self.isFetchingData {
            self.isLoaderHidden.value = false
            self.isFetchingData = true
            self.eventNetworkServices.getEvents(page: "\(self.currentPage)") { (events, message) in
                self.isFetchingData = false
                self.isLoaderHidden.value = true
                if let events = events {
                    self.events.append(events)
                }
            }
        }
    }
    
    // MARK: - Init
    
    init(eventNetworkServices: EventNetworkServices) {
        self.eventNetworkServices = eventNetworkServices
        super.init()
        self.getEvents()
    }
    
}
