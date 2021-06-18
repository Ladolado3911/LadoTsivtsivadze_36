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
    private var inboxDataSource: InboxDataSource!
    
    
    @IBOutlet weak var tblView: UITableView!
    
    
    override func loadView() {
        super.loadView()
        configViewModel()
        if !inboxViewModel.isUserLoggedin {
            inboxViewModel.goToLogin()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    func configViewModel() {
        userManager = UserManager()
        mailManager = MailManager()
        inboxViewModel = InboxViewModel(with1: mailManager, with2: userManager, with3: self)
        inboxDataSource = InboxDataSource(with: tblView,
                                          rootController: self,
                                          viewmodel: inboxViewModel)
    }
}

