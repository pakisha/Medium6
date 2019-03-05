//
//  ViewControllerFactory.swift
//  EncoreJets
//
//  Created by Pavle Pesic on 5/24/18.
//  Copyright © 2018 Pavle Pesic. All rights reserved.
//

protocol AuthViewControllerFactory {
    func instantiateChooseLoginRegisterViewController() -> ChooseLoginRegisterViewController
    func instantiateLoginViewController() -> LoginViewController
    func instantiateRegisterViewController() -> RegisterViewController
}

protocol SideMenuViewControllerFactory {
    func instantiateSideMenuViewController() -> SideMenuViewController
}

protocol WalktroughViewControllerFactory {
    func instantiateWalktroughViewController() -> WalktroughViewController
}

protocol SettingsViewControllerFactory {
    func instantiateSettingsOptionsViewController() -> SettingsOptionsViewController
}

protocol ProfileViewControllerFactory {
    func instantiateUserProfileViewController() -> UserProfileViewController
    func instantiateBecomeAMemberViewController() -> BecomeAMemberViewController
}

protocol PaymentViewControllerFactory {
    func instantiatePaymentOptionsViewController() -> PaymentOptionsViewController
    func instantiateAddPaymentOptionViewController() -> AddPaymentOptionViewController
}

protocol EventsViewControllerFactory {
    func instantiateEventsListViewController() -> EventsListViewController
    func instantiateEventDetailsViewController(event: EventsList.Event) -> EventDetailsViewController
}
