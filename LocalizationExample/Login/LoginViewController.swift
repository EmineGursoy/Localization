//
//  LoginViewController.swift
//  LocalizationExample
//
//  Created by Emine Sinem on 14.08.2023.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var nameEntryLabel: UILabel!
    @IBOutlet weak var emailEntryLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Ekran açıldığı anda setContent fonksiyonu çağrılır
        setContent()
    }
    
    // Seçilmiş olan dile göre UI düzenlenir
    func setContent() {
        nameEntryLabel.text = LocalizationService.shared.localizedString(forKey: "name_entry_title")
        emailEntryLabel.text = LocalizationService.shared.localizedString(forKey: "email_entry_title")
        loginButton.setTitle(LocalizationService.shared.localizedString(forKey: "login_button_title"), for: .normal)
    }
    
    // Uyarı verilmesi gerektiğinde çağrılmak üzere uyarı hazırlama fonksiyonu oluşturulur
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: LocalizationService.shared.localizedString(forKey: "ok_button_title"), style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    // Login butununa tıklandığı anda yapılacaklar
    @IBAction func loginClicked(_ sender: Any) {
        // İsim veya email verileri girilmediyse uyarı verilmesi, girildiyse bu verilerin UserDefaults'a eklenmesi sağlanır
        if nameTextField.text == "" {
            makeAlert(titleInput: LocalizationService.shared.localizedString(forKey: "error_title"), messageInput: LocalizationService.shared.localizedString(forKey: "name_error_message"))
        } else if emailTextField.text == "" {
            makeAlert(titleInput: LocalizationService.shared.localizedString(forKey: "error_title"), messageInput: LocalizationService.shared.localizedString(forKey: "email_error_message"))
        } else {
            
            guard let name = nameTextField.text else { return }
            guard let email = emailTextField.text else { return }
            
            UserDefaults.standard.set(name, forKey: "name")
            UserDefaults.standard.set(email, forKey: "email")
        }
    }
}
