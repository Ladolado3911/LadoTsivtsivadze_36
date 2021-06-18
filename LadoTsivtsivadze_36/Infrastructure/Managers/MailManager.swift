//
//  MailManager.swift
//  LadoTsivtsivadze_36
//
//  Created by lado tsivtsivadze on 6/18/21.
//

import Foundation
import UIKit
import CoreData

final class MailManager {
    var context: NSManagedObjectContext? {
        return (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    }
    
    func getReceivedMails(user usr: User, completion: @escaping ([Mail]?) -> Void) {
        if let receivedMails = usr.receivedMails?.allObjects as? [Mail] {
            completion(receivedMails)
        }
        else {
            completion(nil)
        }
    }
    
    func getSentMails(user usr: User, completion: @escaping ([Mail]?) -> Void) {
        
    }
}
