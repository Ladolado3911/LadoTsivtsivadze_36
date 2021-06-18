//
//  ViewController.swift
//  LadoTsivtsivadze_36
//
//  Created by lado tsivtsivadze on 6/18/21.
//

import UIKit

class InboxController: UIViewController {
    
    
    var user: User?
    
    private var userManager: UserManager!
    private var mailManager: MailManager!
    private var inboxViewModel: InboxViewModel!
    
    override func loadView() {
        super.loadView()
        if !inboxViewModel.isUserLoggedin {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewModel()

    }
    
    func configViewModel() {
        userManager = UserManager()
        mailManager = MailManager()
        inboxViewModel = InboxViewModel(with1: mailManager, with2: userManager)
    }
}

