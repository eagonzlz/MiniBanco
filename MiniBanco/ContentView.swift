//
//  ContentView.swift
//  MiniBanco
//
//  Created by Emanuel Gonzalez on 12/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var userName: String = UserDefaultsManager.shared.loadUserName() // Load from UserDefaults
    @State private var isCredentialsEntered: Bool = false

    var body: some View {
        WelcomeScreenView(userName: $userName, isCredentialsEntered: $isCredentialsEntered)
    }
    
}

#Preview {
    ContentView()
}
