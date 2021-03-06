//
//  RegisterController.swift
//  LadoTsivtsivadze_36
//
//  Created by lado tsivtsivadze on 6/18/21.
//

import UIKit

class RegisterController: UIViewController {
    
    private var userManager: UserManager!
    private var registerViewModel: RegisterViewModel!
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewModel()


    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        usernameField.text = ""
        passwordField.text = ""
    }
    
    func configViewModel() {
        userManager = UserManager()
        registerViewModel = RegisterViewModel(with: userManager, rootController: self)
    }
    
    @IBAction func onRegister(_ sender: UIButton) {
        registerViewModel.register(username: usernameField.text!, password: passwordField.text!) { success in
            if success {
                print("registered successfully")
            }
            else {
                print("Could not register for whatever reason")
            }
        }
        
    }
}
