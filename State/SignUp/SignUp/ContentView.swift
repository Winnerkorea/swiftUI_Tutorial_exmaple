//
//  ContentView.swift
//  SignUp
//
//  Created by Baba on 8/25/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert: Bool = false
    @State private var showUsernameError = false
    @State private var showEmailError = false
    @State private var showPasswordError = false
    
    var body: some View {
        ZStack {
            Color.primaryTheme
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20){
                Text("Sign Up")
                    .font(.system(size: 30, weight: .heavy))
                    .foregroundStyle(.white)
                Text("username")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.white)
                TextField("User Name", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.username)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                
                if showUsernameError {
                    Text("Username is required!")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(.red)
                }
                
                Text("Email")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.white)
                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                if showEmailError {
                    Text("Email is required!")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(.red)
                }
                Text("Password")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.white)
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.password)
                
                if showPasswordError {
                    Text("Password is requried!")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(.red)

                }
                
                Button(action : {
                    
                    showUsernameError = false
                    showEmailError = false
                    showPasswordError = false
                    
                    guard !username.isEmpty else {
                        showUsernameError = true
                        return
                    }
                    
                    guard !email.isEmpty else {
                        showEmailError = true
                        return
                    }
                    
                    guard !password.isEmpty else {
                        showPasswordError = true
                        return
                    }
                    
                    showAlert = true
                    
                    username = ""
                    email  = ""
                    password = ""
                    
                }, label: {
                    Text("Submit")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                })
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.top)
                
                Spacer()
            }
            .padding(.horizontal)
            
        }
        .alert("Sign up Complete", isPresented: $showAlert) {
            
            Button("OK") {
                showAlert = false
            }
            
        } message: {
            Text("Thanks for signing up.")
        }

        
    }
}

#Preview {
    ContentView()
}
