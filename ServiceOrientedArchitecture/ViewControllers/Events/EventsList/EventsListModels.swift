//
//  EventsListModels.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/26/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit

enum EventsList {
    
    class Event: Codable {
        let id: Int
        let name: String
        let category: String
        let dateFrom: String
        let dateTo: String
        let location: String
    }
    
}
