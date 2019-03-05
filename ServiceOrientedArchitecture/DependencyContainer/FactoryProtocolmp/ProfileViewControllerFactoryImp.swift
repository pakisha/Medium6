//
//  ProfileViewControllerFactoryImp.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/26/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import UIKit

extension DependencyContainer: ProfileViewControllerFactory {
    
    func instantiateUserProfileViewController() -> UserProfileViewController {
        let userProfileViewController = UIStoryboard.profile.instantiateViewController(withIdentifier: "UserProfileViewController") as! UserProfileViewController
        userProfileViewController.viewModel = UserProfileViewModel(userNetworkServices: self.userNetworkServices, userServices: self.userServices)
        return userProfileViewController
    }
    
    func instantiateBecomeAMemberViewController() -> BecomeAMemberViewController {
        let becomeAMemberViewController = UIStoryboard.profile.instantiateViewController(withIdentifier: "BecomeAMemberViewController") as! BecomeAMemberViewController
        becomeAMemberViewController.viewModel = BecomeAMemberViewModel()
        return becomeAMemberViewController
    }
    
}
