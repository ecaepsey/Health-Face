//
//  LoginView.swift
//  Health Face
//
//  Created by Damir Aushenov on 4/1/26.
//

import SwiftUI


struct LoginView: View {
    @StateObject private var viewModel: LoginViewModel
    @State private var username = ""
    
    init(viewModel: LoginViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            Text("Welcome back!")
            TextField(LocalizedStringKey("LoginView.username.text"), text: $username)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(.secondary.opacity(0.5), lineWidth: 0.5))
            TextField(LocalizedStringKey("LoginView.password.text"), text: $username)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(.secondary.opacity(0.5), lineWidth: 0.5))
            
            Button {
                
            } label: {
                Text(LocalizedStringKey("LoginView.login.text"))
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.horizontal)
            }
            
            
            
        }
        .padding(14)
        
    }
}
