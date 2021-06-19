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
        super.init()
        tableView = tableView2
        rootController = controller
        viewModel = vm
        user = viewModel.user
        configTable()
    }
    
    func addToTable() {
        guard let user = user else { return }
        viewModel.getReceivedMails(user: user) { receivedMails in
            guard let mails = receivedMails else { return }
            self.inboxMails.append(contentsOf: mails)
            print(self.inboxMails)
            self.tableView.reloadData()
        }
    }
    
    func refresh() {
        tableView.reloadData()
    }
    
    func configTable() {
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "InboxCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "InboxCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(inboxMails.count)
        return inboxMails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InboxCell") as? InboxCell
        cell!.mail = inboxMails[indexPath.row]
        print(inboxMails[indexPath.row].subject)
        return cell!
    }
}
