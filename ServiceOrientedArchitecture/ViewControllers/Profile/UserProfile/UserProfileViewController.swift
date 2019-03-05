//
//  UserProfileViewController.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/26/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit

protocol UserProfileViewControllerProtocol: class {
    var onBack: (() -> Void)? { get set }
    var onBecomeAMember: (() -> Void)? { get set }
}

class UserProfileViewController: UIViewController, UserProfileViewControllerProtocol {
    
    // MARK: - UserProfileViewControllerProtocol
    
    var onBack: (() -> Void)?
    var onBecomeAMember: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    var viewModel: (BaseViewModel & UserProfileViewModelProtocol)?
    
    // MARK: - Outelts
    
    @IBOutlet weak var welcomeLabel: UILabel!
        
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindUI()
    }
    
    // MARK: - Private methods
    
    private func bindUI() {
        self.viewModel?.isLoaderHidden.bindAndFire({ [weak self] in
            self?.shouldHideLoader(isHidden: $0)
        })
        self.viewModel!.user.bind { [weak self] in
            if let user = $0 {
                self?.welcomeLabel.text = "Welcome \(user.fullName)"
            }
        }
        self.viewModel?.alertMessage.bind({ [weak self] in
            self?.showAlertWith(message: $0)
        })
    }
    
    // MARK: - Actions
    
    @IBAction private func actionBack() {
        self.onBack?()
    }
    
    @IBAction private func actionBecomeAMember() {
        self.onBecomeAMember?()
    }
    
    @IBAction private func actionSave() {
        self.viewModel?.updateProfile(params: [:])
    }
    
}
