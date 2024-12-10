//
//  WelcomeScreenView.swift
//  MiniBanco
//
//  Created by Emanuel Gonzalez on 12/10/24.
//


import SwiftUI

struct WelcomeScreenView: View {
    @StateObject private var viewModel = WelcomeScreenViewModel()
    @Binding var userName: String
    @Binding var isCredentialsEntered: Bool
    var body: some View {
        NavigationView {
            ZStack {
                Colors.popNavy
                    .edgesIgnoringSafeArea(.all)
                
                if !isCredentialsEntered {
                    VStack(spacing: 20) {
                        Spacer()
                        Image("1024")
                            .resizable()
                            .frame(width: 100, height: 100)
                        
                        // Login Prompt
                        Text("Mini Banco v1.0")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            // Username Field
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Nombre de Usuario")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                TextField("Introduce tu nombre", text: $viewModel.userName)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding(.horizontal)
                                    .autocapitalization(.none)
                                    .disableAutocorrection(true)
                            }
                            
                            // Password Field
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Contraseña")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                SecureField("Introduce tu contraseña", text: $viewModel.password)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding(.horizontal)
                            }
                        }
                        .padding(.horizontal)
                        
                        // Continue Button
                        Button(action: {
                            if !viewModel.userName.isEmpty && !viewModel.password.isEmpty {
                                isCredentialsEntered = true
                            }
                        }) {
                            Text("Iniciar Sesión")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.popBlue)
                                .cornerRadius(10)
                                .padding(.horizontal)
                        }
                        
                        // Forgot Password Link
                        Button(action: {
                            // Forgot password action placeholder
                        }) {
                            Text("¿Olvidaste tu contraseña?")
                                .font(.footnote)
                                .foregroundColor(.popLightBlue)
                                .padding(.top, 10)
                        }
                        Spacer()
                    }
                    .padding()
                    .navigationBarHidden(true)
                    .accessibilityElement(children: .contain)
                    .accessibilityLabel("Pantalla de inicio de sesión con campos de nombre de usuario y contraseña, enlace para recuperar contraseña, y botón para continuar.")
                } else {
                    VStack(spacing: 20) {
                        // Progress Indicator
                        ProgressBar(progress: [1, 0, 0, 0])
                            .padding(.horizontal, 18)
                        Spacer()
                        Spacer()
                        Text("¡Hola, \(viewModel.userName)!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding()
                        
                        Image("1024")
                        
                        Text("Bienvenido a MiniBanco, tu aplicación de banca confiable. Administra tus finanzas de manera rápida, segura y sencilla.")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                                                    
                        Spacer()
                        
                        // Accept Button
                        NavigationLink(destination: ProfileDetailsView(userName: $userName)) {
                            Text("Aceptar")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.popBlue)
                                .cornerRadius(10)
                                .padding(.horizontal)
                        }
                    }
                    .padding()
                    .navigationBarTitleDisplayMode(.inline)
                    .accessibilityElement(children: .contain)
                    .navigationBarTitleDisplayMode(.inline)
                    .padding()
                    .accessibilityElement(children: .contain)
                    .accessibilityLabel("Pantalla de bienvenida con saludo personalizado, descripción de la aplicación y botón para continuar.")
                }
            }
        }
    }
}
