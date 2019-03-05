//
//  EventDetailsViewController.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/26/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit

protocol EventDetailsViewControllerProtocol: class {
    var onBack: (() -> Void)? { get set }
    var onBuyTickets: (() -> Void)? { get set }
}

class EventDetailsViewController: UIViewController, EventDetailsViewControllerProtocol {
    
    // MARK: - EventDetailsViewControllerProtocol
    
    var onBack: (() -> Void)?
    var onBuyTickets: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    var viewModel: EventDetailsViewModelProtocol?
    
    // MARK: - Outelts
    
    @IBOutlet weak var eventNameLabel: UILabel!
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindUI()
    }
    
    // MARK: - Private methods
    
    private func bindUI() {
        self.viewModel?.event.bindAndFire({ [weak self] in
            self?.eventNameLabel.text = $0.name
        })
    }
    
    // MARK: - Actions
    
    @IBAction private func actionBack() {
        self.onBack?()
    }
    
    @IBAction private func actionBuyTickets() {
        self.onBuyTickets?()
    }
    
}
