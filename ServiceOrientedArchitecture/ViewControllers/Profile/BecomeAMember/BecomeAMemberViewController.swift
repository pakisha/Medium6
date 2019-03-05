//
//  BecomeAMemberViewController.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/26/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit

protocol BecomeAMemberViewControllerProtocol: class {
    var onClose: (() -> Void)? { get set }
}

class BecomeAMemberViewController: UIViewController, BecomeAMemberViewControllerProtocol {
    
    // MARK: - BecomeAMemberViewControllerProtocol
    
    var onClose: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    var viewModel: BecomeAMemberViewModelProtocol?
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction private func actionClose() {
        self.onClose?()
    }
    
}
