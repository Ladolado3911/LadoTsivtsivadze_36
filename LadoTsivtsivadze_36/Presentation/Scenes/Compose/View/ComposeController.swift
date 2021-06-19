//
//  ComposeController.swift
//  LadoTsivtsivadze_36
//
//  Created by lado tsivtsivadze on 6/18/21.
//

import UIKit

class ComposeController: UIViewController {

    @IBOutlet weak var userPicker: UIPickerView!
    @IBOutlet weak var subjectField: UITextField!
    @IBOutlet weak var contentField: UITextView!
    
    private var userManager: UserManager!
    private var mailManager: MailManager!
    private var composeViewModel: ComposeViewModel!
    
    var usersExceptMe: [User] = []
    var me: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewModel()
        configPicker()
        reloadPicker()


    }
    
    func configViewModel() {
        userManager = UserManager()
        mailManager = MailManager()
        composeViewModel = ComposeViewModel(with1: mailManager,
                                            with2: userManager,
                                            with3: self)
    }
    
    func configPicker() {
        userPicker.dataSource = self
        userPicker.delegate = self
    }
    
    func reloadPicker() {
        composeViewModel.getOtherUsers(except: me) { users in
            if let users = users {
                self.usersExceptMe.append(contentsOf: users)
                self.userPicker.reloadAllComponents()
            }
        }
    }
    
    @IBAction func onSned(_ sender: UIButton) {
        
    }
}

extension ComposeController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print("here")
        return usersExceptMe.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print(usersExceptMe.map { $0.username })
        return usersExceptMe[row].username
    }
}

