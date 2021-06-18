//
//  LoginViewModel.swift
//  LadoTsivtsivadze_36
//
//  Created by lado tsivtsivadze on 6/18/21.
//

import Foundation
import UIKit

protocol LoginViewModelProtocol: AnyObject {
    func login(username name: String, password pass: String, completion: @escaping (User?) -> Void)
    
    init(with userManager: UserManager, rootController controller: LoginController)
}

final class LoginViewModel: LoginViewModelProtocol {

    private var userManager: UserManager!
    
    
    init(with userManager2: UserManager, rootController controller: LoginController) {
        userManager = userManager2
    }
    
    func login(username name: String, password pass: String, completion: @escaping (User?) -> Void) {
        userManager.login(username: name, password: pass, completion: completion)
    }
}
