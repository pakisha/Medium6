//
//  AddPaymentOptionViewController.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/29/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit

protocol AddPaymentOptionViewControllerProtocol: class {
    var onBack: (() -> Void)? { get set }
}

class AddPaymentOptionViewController: UIViewController, AddPaymentOptionViewControllerProtocol {
    
    // MARK: - AddPaymentOptionViewControllerProtocol
    
    var onBack: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    var viewModel: AddPaymentOptionViewModelProtocol?
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction private func actionBack() {
        self.onBack?()
    }
    
}
