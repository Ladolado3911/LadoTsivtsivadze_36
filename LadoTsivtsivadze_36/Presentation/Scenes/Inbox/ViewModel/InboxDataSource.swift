//
//  InboxDataSource.swift
//  LadoTsivtsivadze_36
//
//  Created by lado tsivtsivadze on 6/18/21.
//

import Foundation
import UIKit

class InboxDataSource: TableDataSource {
    
    private var tableView: UITableView!
    private var rootController: InboxController!
    private var viewModel: InboxViewModel!
    
    var inboxMails: [Mail] = []
    var user: User?
    
    init(with tableView2: UITableView, rootController controller: InboxController, viewmodel vm: InboxViewModel) {
        tableView = tableView2
        rootController = controller
        viewModel = vm
        user = viewModel.user
    }
    
    func updateTable() {
        guard let user = user else { return }
        viewModel.getReceivedMails(user: user) { receivedMails in
            guard let mails = receivedMails else { return }
            self.inboxMails.append(contentsOf: mails)
            self.tableView.reloadData()
        }
    }
    
    func configTable() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        inboxMails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}
