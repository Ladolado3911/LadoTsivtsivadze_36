//
//  InboxViewModel.swift
//  LadoTsivtsivadze_36
//
//  Created by lado tsivtsivadze on 6/18/21.
//

import Foundation
import UIKit

protocol InboxViewModelProtocol: AnyObject {
    func getReceivedMails(user usr: User, completion: @escaping ([Mail]) -> Void)
    
    init(with1 mailManager: MailManager, with2 userManager: UserManager)
}



final class InboxViewModel: InboxViewModelProtocol {
    
    var userManager: UserManager!
    var mailManager: MailManager!
    
    init(with1 mailManager1: MailManager, with2 userManager2: UserManager) {
        userManager = userManager2
        mailManager = mailManager1
    }
    
    func getReceivedMails(user usr: User, completion: @escaping ([Mail]) -> Void) {
        
    }
}
