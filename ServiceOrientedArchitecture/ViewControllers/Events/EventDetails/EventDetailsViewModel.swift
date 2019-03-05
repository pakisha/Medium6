//
//  EventDetailsViewModel.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/26/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit

protocol EventDetailsViewModelProtocol {
    var event: Dynamic<EventsList.Event> { get }
}

class EventDetailsViewModel: NSObject, EventDetailsViewModelProtocol {
    
    // MARK: - EventDetailsViewModelProtocol
    
    var event: Dynamic<EventsList.Event>
    
    // MARK: - Init
    
    init(event: EventsList.Event) {
        self.event = Dynamic<EventsList.Event>(event)
        super.init()
    }
    
}
