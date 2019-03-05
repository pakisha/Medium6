//
//  PaymentOptionsViewController.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/26/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit

protocol PaymentOptionsViewControllerProtocol: class {
    var onBack: (() -> Void)? { get set }
    var onAddPaymentOption: (() -> Void)? { get set }
}

class PaymentOptionsViewController: UIViewController, PaymentOptionsViewControllerProtocol {
    
    // MARK: - PaymentOptionsViewControllerProtocol
    
    var onBack: (() -> Void)?
    var onAddPaymentOption: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    var viewModel: PaymentOptionsViewModelProtocol?
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction private func actionBack() {
        self.onBack?()
    }
    
    @IBAction private func actionAddPaymentOption() {
        self.onAddPaymentOption?()
    }
    
}
