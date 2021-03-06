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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //inboxDataSource.addToTable()


    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        inboxDataSource.refresh()
    }
    
    func configViewModel() {
        if let user = user {
            userManager = UserManager()
            mailManager = MailManager()
            inboxViewModel = InboxViewModel(with1: mailManager, with2: userManager, with3: self, with4: user)
            inboxDataSource = InboxDataSource(with: tblView,
                                              rootController: self,
                                              viewmodel: inboxViewModel)
            inboxDataSource.addToTable()
        }
        else {
            let vc = Controllers().loginController
            vc.navigationItem.hidesBackButton = true
            pushController(from: self, to: vc, method: .withBackItem)
        }
    }
    
    @IBAction func onOutbox(_ sender: UIBarButtonItem) {
        let vc = Controllers().outboxController
        //print(user)
        vc.user = user
        pushController(from: self, to: vc, method: .withBackItem)
    }
    
    @IBAction func onLogout(_ sender: UIBarButtonItem) {
        popControllerCustom(from: self, method: .withBackItem, number: 1)
    }
    
    @IBAction func onCompose(_ sender: UIButton) {
        let vc = Controllers().composeController
        vc.me = user
        pushController(from: self, to: vc, method: .withBackItem)
    }
}

