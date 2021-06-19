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
        if let sentMails = usr.sentMails?.allObjects as? [Mail] {
            completion(sentMails)
        }
        else {
            completion(nil)
        }
    }
    
    func createMail(from user1: User,
                    to user2: User,
                    subject sbjct: String,
                    content cnt: String,
                    completion: @escaping (Bool) -> Void) {
        
        guard let context = context else { return }
        let newMail = Mail(context: context)
        
        newMail.sender = user1
        newMail.receiver = user2
        
        user1.addToSentMails(newMail)
        user2.addToReceivedMails(newMail)
        
        newMail.subject = sbjct
        newMail.content = cnt
        
        do {
            try context.save()
            completion(true)
        }
        catch {
            print(error)
            completion(false)
        }
    }
}
