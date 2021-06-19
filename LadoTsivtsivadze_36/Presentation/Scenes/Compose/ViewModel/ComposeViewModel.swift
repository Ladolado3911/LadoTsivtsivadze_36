//
//  ComposeViewModel.swift
//  LadoTsivtsivadze_36
//
//  Created by lado tsivtsivadze on 6/18/21.
//

import Foundation
import UIKit


protocol ComposeViewModelProtocol: AnyObject {
    func sendMail(from user1: User,
                  to user2: User,
                  subject sbjct: String,
                  content cnt: String,
                  completion: @escaping (Bool) -> Void)
    
    init(with1 mailManager2: MailManager,
         with2 userManager2: UserManager,
         with3 controller: ComposeController)
}

final class ComposeViewModel: ComposeViewModelProtocol {

    private var mailManager: MailManager!
    private var userManager: UserManager!
    private var rootController: ComposeController!
    
    init(with1 mailManager2: MailManager,
         with2 userManager2: UserManager,
         with3 controller: ComposeController) {

        mailManager = mailManager2
        userManager = userManager2
        rootController = controller
    }
    
    func sendMail(from user1: User,
                  to user2: User,
                  subject sbjct: String,
                  content cnt: String,
                  completion: @escaping (Bool) -> Void) {
        
        mailManager.createMail(from: user1, to: user2, subject: sbjct, content: cnt, completion: completion)
    }
    
    func getOtherUsers(except user: User?, completion: @escaping ([User]?) -> Void) {
        guard let user = user else { return }
        userManager.getAllUsersExceptMe(except: user, completion: completion)
    }
}
