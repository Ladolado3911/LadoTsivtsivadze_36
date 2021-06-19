//
//  OutboxController.swift
//  LadoTsivtsivadze_36
//
//  Created by lado tsivtsivadze on 6/18/21.
//

import UIKit

class OutboxController: UIViewController {

    private var mailManager: MailManager!
    private var userManager: UserManager!
    private var outboxViewModel: OutboxViewModel!
    private var outboxDataSource: OutboxDataSource!
    
    @IBOutlet weak var tblView: UITableView!
    var user: User?
    
    override func loadView() {
        super.loadView()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewModel()
        outboxDataSource.addToTable()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        outboxDataSource.refresh()
    }
    
    func configViewModel() {
        mailManager = MailManager()
        userManager = UserManager()
        outboxViewModel = OutboxViewModel(with1: mailManager, with2: userManager, with3: self, user: user)
        outboxDataSource = OutboxDataSource(with: tblView, rootController: self, viewmodel: outboxViewModel)
        
        outboxDataSource.addToTable()
    }
}
