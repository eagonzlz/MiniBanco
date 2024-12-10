//
//  ProfileConfirmationViewModel.swift
//  MiniBanco
//
//  Created by Emanuel Gonazalez on 12/10/24.
//

import SwiftUI

class ProfileDetailsViewModel: ObservableObject {
    @Published var fullName: String
    @Published var email: String
    @Published var phoneNumber: String
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var alertTitle: String = ""
    
    init() {
        let details = UserDefaultsManager.shared.loadProfileDetails()
        self.fullName = details.0
        self.email = details.1
        self.phoneNumber = details.2
    }
    
    func updateProfileDetails(fullName: String, email: String, phoneNumber: String) {
        self.fullName = fullName
        self.email = email
        self.phoneNumber = phoneNumber
        UserDefaultsManager.shared.saveProfileDetails(fullName: fullName, email: email, phoneNumber: phoneNumber)
    }
}
