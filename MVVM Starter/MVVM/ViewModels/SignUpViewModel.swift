//
//  SignUpUsernameEmailViewModel.swift
//  MVVM
//
//  Created by Baba on 9/10/25.
//

import Foundation
import SwiftUI

class SignUpViewModel:ObservableObject {
    
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var alertTitle = ""
    @Published var alertMessage = ""
    @Published var showNextPage = false
    @Published var showAlertInUsernameEmailView = false
    @Published var showAlertInPasswordView = false
    
    
    func confirmSignUP(){
        if password == confirmPassword {
            alertTitle = "Success!"
            alertMessage = "Please check your email for the activation link."
        } else {
            alertTitle = "Password Mismatch!"
            alertMessage = "Please check passwords."
            password = ""
            confirmPassword = ""
        }
        showAlertInPasswordView = true
    }
    
    func handlePasswordViewAlert(){
        if password == confirmPassword {
            showNextPage = false
        } else {
            showAlertInPasswordView = false
        }
    }
    
    func validate(){
        guard validateEmail() && validateUserName() else {
            return
        }
        showNextPage = true
    }
    
    private func validateUserName() -> Bool {
        guard !username.isEmpty else {
            alertTitle = "Username Required"
            alertMessage = "Please provide a username"
            showAlertInUsernameEmailView = true
            return false
        }
        return true
    }
    
    private func validateEmail() -> Bool {
        guard !email.isEmpty else {
            alertTitle = "Email Required"
            alertMessage = "Please provide a email"
            showAlertInUsernameEmailView = true
            return false
        }
        return true
    }
    

    
}
