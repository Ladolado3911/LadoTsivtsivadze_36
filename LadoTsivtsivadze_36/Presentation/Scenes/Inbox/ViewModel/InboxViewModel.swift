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
    
    init(with1 mailManager: MailManager, with2 userManager: UserManager, with3 controller: InboxController, with4 user2: User)
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
    
    init(with1 mailManager1: MailManager, with2 userManager2: UserManager, with3 controller: InboxController, with4 user2: User) {
        userManager = userManager2
        mailManager = mailManager1
        rootController = controller
        user = user2
    }
    
    func getReceivedMails(user usr: User, completion: @escaping ([Mail]?) -> Void) {
        mailManager.getReceivedMails(user: usr, completion: completion)
    }
    
    func goToLogin() {
        let vc = Controllers.loginController
        vc.navigationItem.hidesBackButton = true
        pushController(from: rootController, to: Controllers.loginController, method: .withBackItem)
    }
}
