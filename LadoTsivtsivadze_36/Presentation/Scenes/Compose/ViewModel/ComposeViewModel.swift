//
//  ComposeViewModel.swift
//  LadoTsivtsivadze_36
//
//  Created by lado tsivtsivadze on 6/18/21.
//

import Foundation
import UIKit


protocol ComposeViewModelProtocol: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
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
    var me: User?

    init(with1 mailManager2: MailManager,
         with2 userManager2: UserManager,
         with3 controller: ComposeController,
         with4 pickerView2: UIPickerView) {
        
        super.init()
        mailManager = mailManager2
        userManager = userManager2
        rootController = controller
        pickerView = pickerView2
        
        getOtherUsers()
    }
    
    func sendMail(from user1: User,
                  to user2: User,
                  subject sbjct: String,
                  content cnt: String,
                  completion: @escaping (Bool) -> Void) {
        
        mailManager.createMail(from: user1, to: user2, subject: sbjct, content: cnt, completion: completion)
    }
    
    func getOtherUsers() {
        guard let me = me else { return }
        userManager.getAllUsersExceptMe(except: me) { users in
            if let users = users {
                self.usersExceptMe.append(contentsOf: users)
            }
            else {
                print("Can not get users except me")
            }
        }
    }
}

extension ComposeViewModel: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        usersExceptMe.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        usersExceptMe[row].username
    }
}
