//
//  UIStoryboard.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/18/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    static var auth: UIStoryboard {
        return UIStoryboard.init(name: "Auth", bundle: nil)
    }
    
    static var events: UIStoryboard {
        return UIStoryboard.init(name: "Events", bundle: nil)
    }
    
    static var main: UIStoryboard {
        return UIStoryboard.init(name: "Main", bundle: nil)
    }
    
    static var payment: UIStoryboard {
        return UIStoryboard.init(name: "Payment", bundle: nil)
    }
    
    static var profile: UIStoryboard {
        return UIStoryboard.init(name: "Profile", bundle: nil)
    }
    
    static var settings: UIStoryboard {
        return UIStoryboard.init(name: "Settings", bundle: nil)
    }
    
    static var sideMenu: UIStoryboard {
        return UIStoryboard.init(name: "SideMenu", bundle: nil)
    }
    
    static var walktrough: UIStoryboard {
        return UIStoryboard.init(name: "Walktrough", bundle: nil)
    }
    
}
