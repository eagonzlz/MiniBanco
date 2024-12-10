//
//  WelcomeScreenViewModel.swift
//  MiniBanco
//
//  Created by Emanuel Gonzalez on 12/10/24.
//


import SwiftUI

class WelcomeScreenViewModel: ObservableObject {
    @Published var userName: String {
        didSet {
            UserDefaultsManager.shared.saveUserName(userName)
        }
    }
    @Published var password: String {
        didSet {
            UserDefaultsManager.shared.savePassword(password)
        }
    }
    
    init() {
        self.userName = UserDefaultsManager.shared.loadUserName()
        self.password = UserDefaultsManager.shared.loadPassword()
    }
}
