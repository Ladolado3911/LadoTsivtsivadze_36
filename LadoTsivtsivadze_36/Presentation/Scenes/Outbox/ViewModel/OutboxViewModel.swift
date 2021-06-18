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
    
    init(with1 mailManager: MailManager, with2 userManager: UserManager, with3 controller: OutboxController)
}

final class OutboxViewModel: OutboxViewModelProtocol {
    
    private var mailManager: MailManager!
    private var userManager: UserManager!
    private var rootController: OutboxController!
    
    
    init(with1 mailManager2: MailManager, with2 userManager2: UserManager, with3 controller: OutboxController) {
        mailManager = mailManager2
        userManager = userManager2
        rootController = controller
    }
    
    func getSentMails(user usr: User, completion: @escaping ([Mail]?) -> Void) {
        mailManager.getSentMails(user: usr, completion: completion)
    }
}
