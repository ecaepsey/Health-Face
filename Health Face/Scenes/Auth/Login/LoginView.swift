//
//  LoginView.swift
//  Health Face
//
//  Created by Damir Aushenov on 4/1/26.
//

import SwiftUI


struct LoginView: View {
    @StateObject private var viewModel: LoginViewModel
    
    @FocusState private var isFocused: Bool
    init(viewModel: LoginViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            VStack {
                Image("dashboardBg")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 240)      // 200–300 px
                    
                    .clipped()
                    .overlay {
                        Image("logo")
                            
                                           .resizable()
                                           .scaledToFit()
                                           .frame(width: 40, height: 40)
                                           
                                           
                    }
                
                Spacer()
            }
            VStack(spacing: 16) {
                
                Text("Welcome back!")
                    .bold()
                    .font(.title)
                    .padding(.horizontal)
                TextField(LocalizedStringKey("LoginView.username.text"), text: username)
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.systemGray6))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(isFocused ? Color.blue : Color.clear, lineWidth: 1)
                            )
                    )
                
                
                TextField(LocalizedStringKey("LoginView.password.text"), text: password)
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.systemGray6))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(isFocused ? Color.blue : Color.clear, lineWidth: 1)
                            )
                    )
                
                
                
                Button {
                    viewModel.handle(.logInTapped)
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
            .frame(maxWidth: 360)
            .padding(.horizontal, 24)
           
        }
        .ignoresSafeArea(edges: .top)
        
    }
    
    private var username: Binding<String> {
            Binding(
                get: { viewModel.state.username },
                set: { viewModel.handle(.usernameChanged($0)) }
            )
        }
    
    private var password: Binding<String> {
            Binding(
                get: { viewModel.state.password },
                set: { viewModel.handle(.passwordChanged($0)) }
            )
        }
}
