//
//  OutboxCell.swift
//  LadoTsivtsivadze_36
//
//  Created by lado tsivtsivadze on 6/18/21.
//

import UIKit

class OutboxCell: UITableViewCell {
    
    var mail: Mail?
    
    @IBOutlet weak var subjectField: UILabel!
    @IBOutlet weak var contentField: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let mail = mail else { return }
        
        subjectField.text = mail.subject
        contentField.text = mail.content
    }
}
