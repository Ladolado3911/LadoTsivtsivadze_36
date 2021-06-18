//
//  UserManager.swift
//  LadoTsivtsivadze_36
//
//  Created by lado tsivtsivadze on 6/18/21.
//

import Foundation
import UIKit
import CoreData


final class UserManager {
    var context: NSManagedObjectContext? {
        return (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    }
    
    func register(username name: String, password pass: String, completion: @escaping (Bool) -> Void) {
        guard let context = context else { return }
        
        let user = User(context: context)
        user.username = name
        user.password = pass
        
        do {
            try context.save()
            completion(true)
        }
        catch {
            print(error)
            completion(false)
        }
    }
    
    func login(username name: String, password pass: String, completion: @escaping (User?) -> Void) {
        guard let context = context else { return }
        
        let request = NSFetchRequest<User>(entityName: "User")
        request.predicate = NSPredicate(format: "username = '\(name)' && password = '\(pass)'")
        
        do {
            let user = try context.fetch(request)
            if let user = user.last {
                completion(user)
            }
            else {
                completion(nil)
            }
        }
        catch {
            print(error)
            completion(nil)
        }
    }
    
    func getAllUsers(completion: @escaping ([User]?) -> Void) {
        guard let context = context else { return }
        
        do {
            let request = NSFetchRequest<User>(entityName: "User")
            let users = try context.fetch(request)
            
            completion(users)
        }
        catch {
            print(error)
            completion(nil)
        }
    }
    
    func getUser(by username: String, completion: @escaping (User?) -> Void) {
        
    }
}
