//
//  Controllers.swift
//  LadoTsivtsivadze_36
//
//  Created by lado tsivtsivadze on 6/18/21.
//

import Foundation
import UIKit

class Controllers {
    static var outboxController: OutboxController = {
        let vc = getController(storyboardID: .outbox, controllerID: .outbox) as? OutboxController
        return vc!
    }()
    
    static var loginController: LoginController = {
        let vc = getController(storyboardID: .login, controllerID: .login) as? LoginController
        return vc!
    }()
    
    static var registerController: RegisterController = {
        let vc = getController(storyboardID: .register, controllerID: .register) as? RegisterController
        return vc!
    }()
    
    static var inboxController: InboxController = {
        let vc = getController(storyboardID: .main, controllerID: .inbox) as? InboxController
        return vc!
    }()
}
