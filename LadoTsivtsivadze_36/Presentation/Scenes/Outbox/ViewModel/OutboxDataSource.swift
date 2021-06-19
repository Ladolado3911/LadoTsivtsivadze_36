//
//  OutboxDataSource.swift
//  LadoTsivtsivadze_36
//
//  Created by lado tsivtsivadze on 6/18/21.
//

import Foundation
import UIKit

class OutboxDataSource: TableDataSource {
    
    private var tableView: UITableView!
    private var rootController: OutboxController!
    private var viewModel: OutboxViewModel!
    
    var outboxMails: [Mail] = []
    var user: User?
    
    init(with tableView2: UITableView, rootController controller: OutboxController, viewmodel vm: OutboxViewModel) {
        super.init()
        tableView = tableView2
        rootController = controller
        viewModel = vm
        user = viewModel.user
        configTable()
        addToTable()
    }
    
    func addToTable() {
        print("Here")
        guard let user = user else { return }
        print("Unwrapped")
        viewModel.getSentMails(user: user) { sentMails in
            guard let mails = sentMails else { return }
            self.outboxMails = mails
            print(self.outboxMails)
            self.tableView.reloadData()
        }
    }
    
    func refresh() {
        tableView.reloadData()
    }
    
    func configTable() {
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "OutboxCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "OutboxCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(outboxMails.count)
        return outboxMails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OutboxCell") as? OutboxCell
        cell!.mail = outboxMails[indexPath.row]
        print(outboxMails[indexPath.row].subject)
        return cell!
    }
}
