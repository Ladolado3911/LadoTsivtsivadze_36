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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewModel()


    }
    
    func configViewModel() {
        mailManager = MailManager()
        userManager = UserManager()
        outboxViewModel = OutboxViewModel(with1: mailManager, with2: userManager, with3: self)
    }
}
