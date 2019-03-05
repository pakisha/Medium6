//
//  PaymentViewControllerFactoryImp.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/26/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import UIKit

extension DependencyContainer: PaymentViewControllerFactory {
    
    func instantiatePaymentOptionsViewController() -> PaymentOptionsViewController {
        let paymentOptionsViewController = UIStoryboard.payment.instantiateViewController(withIdentifier: "PaymentOptionsViewController") as! PaymentOptionsViewController
        paymentOptionsViewController.viewModel = PaymentOptionsViewModel(userServices: self.userServices)
        return paymentOptionsViewController
    }
    
    func instantiateAddPaymentOptionViewController() -> AddPaymentOptionViewController {
        let addPaymentOptionViewController = UIStoryboard.payment.instantiateViewController(withIdentifier: "AddPaymentOptionViewController") as! AddPaymentOptionViewController
        addPaymentOptionViewController.viewModel = AddPaymentOptionViewModel(userNetworkServices: self.userNetworkServices)
        return addPaymentOptionViewController
    }
    
}
