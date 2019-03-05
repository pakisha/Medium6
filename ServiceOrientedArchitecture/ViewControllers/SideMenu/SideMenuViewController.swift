//
//  SideMenuViewController.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/22/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit

protocol SideMenuViewControllerProtocol: class {
    var onEvents: (() -> Void)? { get set }
    var onProfile: (() -> Void)? { get set }
    var onSettings: (() -> Void)? { get set }
    var onPayment: (() -> Void)? { get set }
}

class SideMenuViewController: UIViewController, SideMenuViewControllerProtocol {
    
    // MARK: - SideMenuViewControllerProtocol
    
    var onEvents: (() -> Void)?
    var onPayment: (() -> Void)?
    var onProfile: (() -> Void)?
    var onSettings: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    var viewModel: SideMenuViewModelProtocol?
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction private func actionEvents() {
        self.onEvents?()
    }
    
    @IBAction private func actionProfile() {
        self.onProfile?()
    }
    
    @IBAction private func actionSettings() {
        self.onSettings?()
    }
    
    @IBAction private func actionPayment() {
        self.onPayment?()
    }
    
}
