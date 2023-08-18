//
//  LanguageSelectionViewController.swift
//  LocalizationExample
//
//  Created by Emine Sinem on 13.08.2023.
//

import UIKit

class LanguageSelectionViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var languageSelectionLabel: UILabel!
    @IBOutlet weak var turkishSelectionButton: UIButton!
    @IBOutlet weak var englishSelectionButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Ekran açıldığı anda setContent() fonksiyonu çağrılarak UI düzenlenir
        setContent()
    }

    // LocalizationService üzerindeki verilerle UI düzenlenir
    func setContent() {
        // welcomeLabel'ın üzerine "welcome_title" keyi için saklanmış olan çeviri eklenir
        welcomeLabel.text = LocalizationService.shared.localizedString(forKey: "welcome_title")
        languageSelectionLabel.text = LocalizationService.shared.localizedString(forKey: "language_selection_title")
        turkishSelectionButton.setTitle(LocalizationService.shared.localizedString(forKey: "turkish_selection_button_title"), for: .normal)
        englishSelectionButton.setTitle(LocalizationService.shared.localizedString(forKey: "english_selection_button_title"), for: .normal)
        continueButton.setTitle(LocalizationService.shared.localizedString(forKey: "continue_button_title"), for: .normal)
        updateBackButton()
    }
    
    // Kullanıcı dili değiştirdiğinde çağrılacak olan fonksiyon
    func updateAppLanguage(_ language: String) {
        // Seçilen dil LocalizationService üzerindeki selectedLanguage değişkenine atanır
        LocalizationService.shared.selectedLanguage = language
        setContent()
    }
    
    // Back butonu için düzenlemeler yapılır
    func updateBackButton() {
        let backButton = UIBarButtonItem()
        backButton.title = LocalizationService.shared.localizedString(forKey: "back_button_title")
        navigationItem.backBarButtonItem = backButton

        navigationController?.navigationBar.tintColor = .black
    }

    // Türkçe seçilirse updateAppLanguage() fonksiyonu "tr" parametresiyle çağrılır
    @IBAction func turkishClicked(_ sender: Any) {
        updateAppLanguage("tr")
    }
    
    // İngilizce seçilirse updateAppLanguage() fonksiyonu "en" parametresiyle çağrılır
    @IBAction func englishClicked(_ sender: Any) {
        updateAppLanguage("en")
    }
    
    @IBAction func continueClicked(_ sender: Any) {
    }
}

