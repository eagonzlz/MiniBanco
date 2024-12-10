//
//  UserDefaultsManager.swift
//  MiniBanco
//
//  Created by Emanuel Gonzalez on 12/10/24.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private let userNameKey = "userName"
    private let passwordKey = "password"
    private let fullNameKey = "fullName"
    private let emailKey = "email"
    private let phoneNumberKey = "phoneNumber"
    
    func saveUserName(_ userName: String) {
        UserDefaults.standard.set(userName, forKey: userNameKey)
    }
    
    func loadUserName() -> String {
        UserDefaults.standard.string(forKey: userNameKey) ?? ""
    }
    
    func savePassword(_ password: String) {
        UserDefaults.standard.set(password, forKey: passwordKey)
    }
    
    func loadPassword() -> String {
        UserDefaults.standard.string(forKey: passwordKey) ?? ""
    }
    
    func saveProfileDetails(fullName: String, email: String, phoneNumber: String) {
        UserDefaults.standard.set(fullName, forKey: fullNameKey)
        UserDefaults.standard.set(email, forKey: emailKey)
        UserDefaults.standard.set(phoneNumber, forKey: phoneNumberKey)
    }
    
    func loadProfileDetails() -> (String, String, String) {
        let fullName = UserDefaults.standard.string(forKey: fullNameKey) ?? "David L Díaz Martínez"
        let email = UserDefaults.standard.string(forKey: emailKey) ?? "daviddiazmar@gmail.com"
        let phoneNumber = UserDefaults.standard.string(forKey: phoneNumberKey) ?? "787-585-5858"
        return (fullName, email, phoneNumber)
    }
}
