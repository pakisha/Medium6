//
//  ChooseLoginRegisterViewController.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/18/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.


import UIKit

protocol ChooseLoginRegisterViewControllerProtocol: class {
    var onLogin: (() -> Void)? { get set }
    var onRegister: (() -> Void)? { get set }
}

class ChooseLoginRegisterViewController: UIViewController, ChooseLoginRegisterViewControllerProtocol {
    
    // MARK: - ChooseLoginRegisterViewControllerProtocol
    
    var onLogin: (() -> Void)?
    var onRegister: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    var viewModel: ChooseLoginRegisterViewModelProtocol!
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction private func actionLogin() {
        self.onLogin?()
    }
    
    @IBAction private func actionRegister() {
        self.onRegister?()
    }
    
}
