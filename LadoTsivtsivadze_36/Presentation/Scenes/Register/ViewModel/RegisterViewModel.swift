//
//  RegisterViewModel.swift
//  LadoTsivtsivadze_36
//
//  Created by lado tsivtsivadze on 6/18/21.
//

import Foundation
import UIKit

protocol RegisterViewModelProtocol: AnyObject {
    func register(username name: String, password pass: String, completion: @escaping (Bool) -> Void)
    
    init(with userManager2: UserManager, rootController controller: RegisterController)
}

final class RegisterViewModel: RegisterViewModelProtocol {
    
    private var userManager: UserManager!
    
    
    init(with userManager2: UserManager, rootController controller: RegisterController) {
        userManager = userManager2
    }
    
    func register(username name: String, password pass: String, completion: @escaping (Bool) -> Void) {
        userManager.register(username: name, password: pass, completion: completion)
    }
}
