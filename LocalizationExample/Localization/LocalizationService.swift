//
//  LocalizationService.swift
//  LocalizationExample
//
//  Created by Emine Sinem on 14.08.2023.
//

import Foundation

class LocalizationService {
    // Singleton örneğini paylaşan property
    static let shared = LocalizationService()

    // Seçili dil kodunu döndüren veya set eden computed property
    var selectedLanguage: String {
        get {
            // UserDefaults'tan kullanıcının seçtiği dil alınır, herhangi bir değer yoksa default olarak "en"
            return UserDefaults.standard.string(forKey: "selectedLanguage") ?? "en"
        }
        set {
            // Seçilen dil selectedKeyLanguage key'i ile UserDefaults'ta saklanır
            UserDefaults.standard.set(newValue, forKey: "selectedLanguage")
        
            // NotificationCenter aracılığıyla "LanguageChanged" adlı bir notification gönderilir
            NotificationCenter.default.post(name: Notification.Name("languageChanged"), object: nil)
        }
    }

    // Örneği oluşturmayı kısıtlayan özel init fonksiyonu
    private init() {}

    // Parametre olarak verilen key için saklanılan metni döndüren fonksiyon
    func localizedString(forKey key: String) -> String {
        // Seçili dil için lproj dosyasının yolu alınır
        if let path = Bundle.main.path(forResource: selectedLanguage, ofType: "lproj"),
           // lproj dosyasından localizedBundle oluşturulur
           let localizedBundle = Bundle(path: path) {
            // NSLocalizedString hazır fonksiyonu kullanılarak verilen key için çeviri metni döndürülür
            return NSLocalizedString(key, bundle: localizedBundle, value: "", comment: "")
        }
        // Anahtar için çeviri bulunamazsa boş bir string döndürülür
        return ""
    }
}

