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
        guard let me = me else { return }
        let destinationUsername = usersExceptMe[userPicker.selectedRow(inComponent: 0)].username ?? ""
        userManager.getUserByUsername(username: destinationUsername) { user in
            guard let user = user else { return }
            self.composeViewModel.sendMail(from: me,
                                           to: user,
                                           subject: self.subjectField.text!,
                                           content: self.contentField.text) { success in
                
                if success {
                    print("Sent Successfuly")
                }
                else {
                    print("Could not send")
                }
            }
        }
    }
}

extension ComposeController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return usersExceptMe.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return usersExceptMe[row].username
    }
}

