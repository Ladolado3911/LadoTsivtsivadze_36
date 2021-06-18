//
//  InboxCell.swift
//  LadoTsivtsivadze_36
//
//  Created by lado tsivtsivadze on 6/18/21.
//

import UIKit

class InboxCell: UITableViewCell {

    @IBOutlet weak var senderName: UILabel!
    @IBOutlet weak var subject: UILabel!
    
    var mail: Mail?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let mail = mail else { return }
        guard let sender = mail.sender else { return }
        
        senderName.text = sender.username
        subject.text = mail.subject
    }
}
