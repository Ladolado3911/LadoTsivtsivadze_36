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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        usernameField.text = ""
        passwordField.text = ""
    }
    
    func configViewModel() {
        userManager = UserManager()
        loginViewModel = LoginViewModel(with: userManager, rootController: self)
    }
    
    @IBAction func onLogin(_ sender: UIButton) {
        if usernameField.text == "" || passwordField.text == "" {
            return
        }
        loginViewModel.login(username: usernameField.text!, password: passwordField.text!) { user in
            let vc = Controllers.inboxController
            if let user = user {
                //vc.navigationItem.hidesBackButton = true
                print("Found User")
                //pushController(from: self, to: vc, method: .withBackItem)
            }
            else {
                print("Could not find user")
            }
        }
    }
    
    @IBAction func goToRegister(_ sender: UIButton) {
        pushController(from: self, to: Controllers.registerController, method: .withBackItem)
    }
}
