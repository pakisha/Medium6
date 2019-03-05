//
//  EventTableViewCell.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/28/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    // MARK: - Outelts
    
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - Public methods
    
    func populate(event: EventsList.Event) {
        self.categoryLabel.text = event.category
        self.titleLabel.text = event.name
        self.locationLabel.text = event.location
        
        let dateFormatter = DateFormatter.fullDateFormatter()
        let startDate = dateFormatter.date(from: event.dateFrom)
        let endDate = dateFormatter.date(from: event.dateTo)
        
        let dayMonthDateFormatter = DateFormatter.dayMonthDateFormatter()
        self.dateLabel.text = "\(dayMonthDateFormatter.string(from: startDate!)) - \(dayMonthDateFormatter.string(from: endDate!))"
        
    }
    
}
