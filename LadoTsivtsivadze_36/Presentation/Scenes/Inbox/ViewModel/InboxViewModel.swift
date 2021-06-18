//
//  InboxViewModel.swift
//  LadoTsivtsivadze_36
//
//  Created by lado tsivtsivadze on 6/18/21.
//

import Foundation
import UIKit

protocol InboxViewModelProtocol: AnyObject {
    func getReceivedMails(user usr: User, completion: @escaping ([Mail]?) -> Void)
    
    init(with1 mailManager: MailManager, with2 userManager: UserManager, with3 controller: InboxController)
}

final class InboxViewModel: InboxViewModelProtocol {
    
    var userManager: UserManager!
    var mailManager: MailManager!
    var rootController: InboxController!
    
    var user: User?
    var isUserLoggedin: Bool {
        if let user = user {
            return true
        }
        else {
            return false
        }
    }
    
    init(with1 mailManager1: MailManager, with2 userManager2: UserManager, with3 controller: InboxController) {
        userManager = userManager2
        mailManager = mailManager1
        rootController = controller
    }
    
    func getReceivedMails(user usr: User, completion: @escaping ([Mail]?) -> Void) {
        mailManager.getReceivedMails(user: usr, completion: completion)
    }
    
    func goToLogin() {
        pushController(from: rootController, to: Controllers.loginController, method: .withBackItem)
    }
}
