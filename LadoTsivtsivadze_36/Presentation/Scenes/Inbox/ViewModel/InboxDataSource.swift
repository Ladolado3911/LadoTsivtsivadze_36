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
    }
    
    func updateTable() {
        //viewModel.getReceivedMails(user: <#T##User#>, completion: <#T##([Mail]?) -> Void#>)
    }
    
    func configTable() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}
