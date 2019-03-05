//
//  SettingsOptionsViewController.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/26/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit

protocol SettingsOptionsViewControllerProtocol: class {
    var onBack: (() -> Void)? { get set }
    var onLogout: (() -> Void)? { get set }
}

class SettingsOptionsViewController: UIViewController, SettingsOptionsViewControllerProtocol {
    
    // MARK: - SettingsOptionsViewControllerProtocol
    
    var onBack: (() -> Void)?
    var onLogout: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    var viewModel: SettingsOptionsViewModelProtocol?
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction private func actionBack() {
        self.onBack?()
    }
    
    @IBAction private func actionLogout() {
        self.onLogout?()
    }
    
}
