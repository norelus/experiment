//
//  CombineForm.swift
//  Experiment
//
//  Created by Aurélien Caille on 25/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI
import Combine

//https://developer.apple.com/documentation/combine/receiving-and-handling-events-with-combine

class UserRegistrationViewModel: ObservableObject {
    // Input
    @Published var username = ""
    @Published var password = ""
    @Published var passwordConfirm = ""

    // Output
    @Published var isUsernameLengthValid = false
    @Published var isPasswordLengthValid = false
    @Published var isPasswordCapitalLetter = false
    @Published var isPasswordConfirmValid = false
    
    @Published var isFormValid = false
        
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        $username.receive(on: RunLoop.main)
            .map { username in
                return username.count >= 4
            }
            .assign(to: \.isUsernameLengthValid, on: self)
            .store(in: &cancellableSet)
        
        $password.receive(on: RunLoop.main)
            .map { password in
                return password.count >= 8
            }
            .assign(to: \.isPasswordLengthValid, on: self)
            .store(in: &cancellableSet)

        $password.receive(on: RunLoop.main)
            .map { password in
                let pattern = "[A-Z]"
                if let _ = password.range(of: pattern, options: .regularExpression) {
                    return true
                } else {
                    return false
                }
            }
            .assign(to: \.isPasswordCapitalLetter, on: self)
            .store(in: &cancellableSet)

        Publishers.CombineLatest($password, $passwordConfirm)
            .receive(on: RunLoop.main)
            .map { (password, passwordConfirm) in
                return !passwordConfirm.isEmpty && passwordConfirm == password
            }
            .assign(to: \.isPasswordConfirmValid, on: self)
            .store(in: &cancellableSet)

        
        Publishers.CombineLatest4($isUsernameLengthValid, $isPasswordLengthValid, $isPasswordCapitalLetter, $isPasswordConfirmValid)
            .receive(on: RunLoop.main)
            .map { $0 && $1 && $2 && $3 }
            .assign(to: \.isFormValid, on: self)
            .store(in: &cancellableSet)
        
    }
}

struct CombineForm: View {
    
    @ObservedObject private var viewModel = UserRegistrationViewModel()
    
    @State var showAlert = false
    
    let redColor = Color(red: 251/255, green: 128/255, blue: 128/255)
    
    var body: some View {
        VStack {
            Text("Create an account")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .padding(.bottom, 30)
            
            FormField(fieldName: "Username", fieldValue: $viewModel.username)
            RequirementText(iconColor: viewModel.isUsernameLengthValid ? Color.secondary : redColor,
                            text: "A minimum of 4 characters",
                            isStrikeThrough: viewModel.isUsernameLengthValid)
                .padding()
            
            FormField(fieldName: "Password", fieldValue: $viewModel.password, isSecure: true)
            VStack {
                RequirementText(iconName: "lock.open",
                                iconColor: viewModel.isPasswordLengthValid ? Color.secondary : redColor,
                                text: "A minimum of 8 characters",
                                isStrikeThrough: viewModel.isPasswordLengthValid)
                RequirementText(iconName: "lock.open",
                                iconColor: viewModel.isPasswordCapitalLetter ? Color.secondary : redColor,
                                text: "One uppercase letter",
                                isStrikeThrough: viewModel.isPasswordCapitalLetter)
            }
            .padding()
            
            FormField(fieldName: "Confirm Password", fieldValue: $viewModel.passwordConfirm, isSecure: true)
            RequirementText(iconColor: viewModel.isPasswordConfirmValid ? Color.secondary : redColor,
                            text: "Your confirm password should be the same as password",
                            isStrikeThrough: viewModel.isPasswordConfirmValid)
                .padding()
                .padding(.bottom, 50)
            
            Button(action: {
                // Proceed to the next screen
                showAlert = true
            }) {
                Text("Sign Up")
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(viewModel.isFormValid ? .white : .gray)
                    .bold()
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 251/255, green: 128/255, blue: 128/255), Color(red: 253/255, green: 193/255, blue: 104/255)]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
                    .padding(.horizontal)
            }.disabled(!viewModel.isFormValid)
            
            HStack {
                Text("Already have an account?")
                    .font(.system(.body, design: .rounded))
                    .bold()
                    
                Button(action: {
                    // Proceed to Sign in screen
                }) {
                    Text("Sign in")
                        .font(.system(.body, design: .rounded))
                        .bold()
                        .foregroundColor(Color(red: 251/255, green: 128/255, blue: 128/255))
                }
            }.padding(.top, 50)
            
            Spacer()
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Bravo"), message: Text("On peut se logger"), dismissButton: .default(Text("OK")))
        }
        .navigationTitle("Combine formulaire")
    }
    

}

struct CombineForm_Previews: PreviewProvider {
    static var previews: some View {
        CombineForm()
    }
}

struct FormField: View {
    var fieldName = ""
    @Binding var fieldValue: String
    
    var isSecure = false
    
    var body: some View {
        
        VStack {
            if isSecure {
                SecureField(fieldName, text: $fieldValue)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
                
            } else {
                TextField(fieldName, text: $fieldValue)                 .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
            }

            Divider()
                .frame(height: 1)
                .background(Color(red: 240/255, green: 240/255, blue: 240/255))
                .padding(.horizontal)
            
        }
    }
}

struct RequirementText: View {
    
    var iconName = "xmark.square"
    var iconColor = Color(red: 251/255, green: 128/255, blue: 128/255)
    
    var text = ""
    var isStrikeThrough = false
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(iconColor)
            Text(text)
                .font(.system(.body, design: .rounded))
                .foregroundColor(.secondary)
                .strikethrough(isStrikeThrough)
            Spacer()
        }
    }
}

