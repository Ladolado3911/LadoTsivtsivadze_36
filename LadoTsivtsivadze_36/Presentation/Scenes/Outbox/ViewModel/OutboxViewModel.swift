//
//  OutboxViewModel.swift
//  LadoTsivtsivadze_36
//
//  Created by lado tsivtsivadze on 6/18/21.
//

import Foundation
import UIKit

protocol OutboxViewModelProtocol: AnyObject {
    func getSentMails(user usr: User, completion: @escaping ([Mail]?) -> Void)
    
    init(with1 mailManager: MailManager, with2 userManager: UserManager, with3 controller: OutboxController, user usr: User?)
}

final class OutboxViewModel: OutboxViewModelProtocol {
    
    private var mailManager: MailManager!
    private var userManager: UserManager!
    private var rootController: OutboxController!

    var user: User?
    var isUserLoggedin: Bool {
        if let user = user {
            return true
        }
        else {
            return false
        }
    }
    
    
    init(with1 mailManager2: MailManager, with2 userManager2: UserManager, with3 controller: OutboxController, user usr: User?) {
        mailManager = mailManager2
        userManager = userManager2
        rootController = controller
        user = usr
    }
    
    func getSentMails(user usr: User, completion: @escaping ([Mail]?) -> Void) {
        mailManager.getSentMails(user: usr, completion: completion)
    }
}
