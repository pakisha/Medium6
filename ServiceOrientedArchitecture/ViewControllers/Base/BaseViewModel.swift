//
//  BaseViewModel.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/29/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import Foundation

protocol BaseViewModelProtocol {
    var alertMessage: Dynamic<AlertMessage> { get set }
    var isLoaderHidden: Dynamic<Bool> { get set }
}

class BaseViewModel: NSObject, BaseViewModelProtocol {
    
    // MARK: - BaseViewModelProtocol
    
    var alertMessage: Dynamic<AlertMessage> = Dynamic(AlertMessage(title: "", body: ""))
    var isLoaderHidden: Dynamic<Bool> = Dynamic(true)
    
}
