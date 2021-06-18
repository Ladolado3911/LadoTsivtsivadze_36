//
//  LoginController.swift
//  LadoTsivtsivadze_36
//
//  Created by lado tsivtsivadze on 6/18/21.
//

import UIKit

class LoginController: UIViewController {
    
    private var userManager: UserManager!
    private var loginViewModel: LoginViewModel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configViewModel()


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func configViewModel() {
        userManager = UserManager()
        loginViewModel = LoginViewModel(with: userManager, rootController: self)
    }
}
