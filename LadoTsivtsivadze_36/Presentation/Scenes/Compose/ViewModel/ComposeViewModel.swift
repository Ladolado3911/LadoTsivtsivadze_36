//
//  ComposeViewModel.swift
//  LadoTsivtsivadze_36
//
//  Created by lado tsivtsivadze on 6/18/21.
//

import Foundation
import UIKit


protocol ComposeViewModelProtocol: NSObject, UIPickerViewDataSource {
    func sendMail(from user1: User,
                  to user2: User,
                  subject sbjct: String,
                  content cnt: String,
                  completion: @escaping (Bool) -> Void)
    
    init(with1 mailManager2: MailManager,
         with2 userManager2: UserManager,
         with3 controller: ComposeController,
         with4 pickerView2: UIPickerView)
}

final class ComposeViewModel: NSObject, ComposeViewModelProtocol {

    private var mailManager: MailManager!
    private var userManager: UserManager!
    private var rootController: ComposeController!
    private var pickerView: UIPickerView!
    
    var usersExceptMe: [User] = []

    init(with1 mailManager2: MailManager,
         with2 userManager2: UserManager,
         with3 controller: ComposeController,
         with4 pickerView2: UIPickerView) {
        
        mailManager = mailManager2
        userManager = userManager2
        rootController = controller
        pickerView = pickerView2
    }
    
    func sendMail(from user1: User,
                  to user2: User,
                  subject sbjct: String,
                  content cnt: String,
                  completion: @escaping (Bool) -> Void) {
        
        mailManager.createMail(from: user1, to: user2, subject: sbjct, content: cnt, completion: completion)
    }
    
    func getOtherUsers(except user: User, completion: @escaping ([User]?) -> Void) {
        userManager.getAllUsersExceptMe(except: user, completion: completion)
    }
}

extension ComposeViewModel: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        usersExceptMe.count
    }
}
