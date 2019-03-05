//
//  EventNetworkServices.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/27/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import Foundation

class EventNetworkServices {
    
    // MARK: - Vars & Lets
    
    private let apiManager: APIManager
    
    // MARK: - Public methods
    
    func getEvents(page: String, handler: @escaping (_ events: [EventsList.Event]?, _ message: AlertMessage?)->()) {
        self.apiManager.call(type: RequestItemsType.events(page)) { (events: [EventsList.Event]?, message: AlertMessage?) in
            if let events = events {
                handler(events, nil)
            } else {
                handler(nil, message!)
            }
        }
    }
    
    // MARK: - Initialization
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
}
