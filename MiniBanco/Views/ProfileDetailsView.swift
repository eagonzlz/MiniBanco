//
//  ProfileConfirmationScreenView.swift
//  MiniBanco
//
//  Created by Emanuel Gonzalez on 12/10/24.
//

import SwiftUI

struct ProfileDetailsView: View {
    @StateObject private var profileDetails = ProfileDetailsViewModel()
    @Binding var userName: String

    var body: some View {
        NavigationView {
            ZStack {
                // Background Color
                Colors.popNavy.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    VStack(spacing: 30) {
                        // Progress Indicator
                        HStack {
                            ProgressView(value: 1)
                                .progressViewStyle(LinearProgressViewStyle(tint: Color.popLightBlue))
                                .frame(height: 4)
                                .padding(.horizontal)
                            Spacer()
                            Image(systemName: "questionmark.circle")
                                .foregroundColor(Color.popLightBlue)
                                .padding(.horizontal)
                        }
                        .padding(.horizontal)
                        .padding(.horizontal)

                        // Header Section
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Información personal")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)

                            Text("Confirma tu información")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)

                        // Profile Details Section
                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Nombre completo")
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                    Text(profileDetails.fullName)
                                        .font(.body)
                                }
                                Spacer()
                            }
                            Divider()
                            HStack {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Correo electrónico")
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                    Text(profileDetails.email)
                                        .font(.body)
                                }
                                Spacer()
                            }
                            Divider()
                            HStack {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Número de celular")
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                    Text(profileDetails.phoneNumber)
                                        .font(.body)
                                }
                                Spacer()
                            }
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)

                        // Information Note Section
                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                Image(systemName: "info.circle")
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Si tu información personal no está correcta, por favor llámanos al ")
                                        .font(.footnote)
                                        .foregroundColor(Color.gray) +
                                    Text("787-724-3655")
                                        .font(.footnote)
                                        .foregroundColor(Color.popBlue)
                                }
                                Spacer()
                            }
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)

                        Spacer()

                        // Confirm Button
                        Button(action: {
                            profileDetails.alertMessage = "Información confirmada con éxito."
                            profileDetails.showAlert = true
                            profileDetails.alertTitle = "Confirmación"
                        }) {
                            Text("Confirmar")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Colors.popBlue)
                                .cornerRadius(10)
                                .padding(.horizontal)
                        }
                        .alert(isPresented: $profileDetails.showAlert) {
                            Alert(title: Text(profileDetails.alertTitle), message: Text(profileDetails.alertMessage), dismissButton: .default(Text("OK")))
                        }

                        // Edit Button
                        Button(action: {
                            profileDetails.alertMessage = "Acción bajo desarrollo."
                            profileDetails.showAlert = true
                            profileDetails.alertTitle = "Error"
                        }) {
                            Text("Editar")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.popBlue)
                                .cornerRadius(10)
                                .padding(.horizontal)
                        }
                        .alert(isPresented: $profileDetails.showAlert) {
                            Alert(title: Text(profileDetails.alertTitle), message: Text(profileDetails.alertMessage), dismissButton: .default(Text("OK")))
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfileDetailsView(userName: .constant("Steve"))
}
