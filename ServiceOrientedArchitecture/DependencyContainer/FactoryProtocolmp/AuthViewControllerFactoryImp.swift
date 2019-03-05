//
//  ViewControllerFactoryImp.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/18/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import UIKit

extension DependencyContainer: AuthViewControllerFactory {
    
    func instantiateChooseLoginRegisterViewController() -> ChooseLoginRegisterViewController {
        let chooseLoginRegisterViewController = UIStoryboard.auth.instantiateViewController(withIdentifier: "ChooseLoginRegisterViewController") as! ChooseLoginRegisterViewController
        chooseLoginRegisterViewController.viewModel = ChooseLoginRegisterViewModel()
        return chooseLoginRegisterViewController
    }
    
    func instantiateLoginViewController() -> LoginViewController {
        let loginViewController = UIStoryboard.auth.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        loginViewController.viewModel = LoginViewModel(authServices: self.authNetworkServices)
        return loginViewController
    }
    
    func instantiateRegisterViewController() -> RegisterViewController {
        let registerViewController = UIStoryboard.auth.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        registerViewController.viewModel = RegisterViewModel(authServices: self.authNetworkServices)
        return registerViewController
    }
    
}
