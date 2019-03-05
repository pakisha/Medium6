//
//  CoordinatorFactory.swift
//  iOSStyleguide
//
//  Created by Pavle Pesic on 3/14/18.
//  Copyright © 2018 Fabrika. All rights reserved.
//

import UIKit

protocol CoordinatorFactoryProtocol {
    func instantiateApplicationCoordinator() -> ApplicationCoordinator
    func instantiateAuthCoordinator(router: RouterProtocol) -> AuthCoordinator
    func instantiateWalktroughCoordinator(router: RouterProtocol) -> WalktroughCoordinator
    func instantiateSideMenuCoordinator(router: RouterProtocol) -> SideMenuCoordinator
    func instantiateSettingsCoordinator(router: RouterProtocol) -> SettingsCoordinator
    func instantiateEventsCoordinator(router: RouterProtocol) -> EventsCoordinator
    func instantiateProfileCoordinator(router: RouterProtocol) -> ProfileCoordinator
    func instantiatePaymentCoordinator(router: RouterProtocol) -> PaymentCoordinator
}
