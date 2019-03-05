//
//  RegisterViewController.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/21/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit

protocol RegisterViewControllerProtocol: class {
    var onBack: (() -> Void)? { get set }
    var onRegister: (() -> Void)? { get set }
}

class RegisterViewController: UIViewController, RegisterViewControllerProtocol {
    
    // MARK: - RegisterViewControllerProtocol
    
    var onBack: (() -> Void)?
    var onRegister: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    var viewModel: RegisterViewModelProtocol?
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction private func actionBack() {
        self.onBack?()
    }
    
    @IBAction private func actionRegister() {
        self.onRegister?()
    }
    
}
