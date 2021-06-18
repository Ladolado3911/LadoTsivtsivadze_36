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
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
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
    
    @IBAction func onLogin(_ sender: UIButton) {
        
    }
    
    @IBAction func goToRegister(_ sender: UIButton) {
        
    }
}
