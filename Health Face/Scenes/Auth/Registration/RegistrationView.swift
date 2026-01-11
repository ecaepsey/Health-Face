//
//  RegistrationView.swift
//  Health Face
//
//  Created by Damir Aushenov on 10/1/26.
//

import SwiftUI


struct RegistrationView: View {
    
    @StateObject private var viewModel: RegistrationViewModel
    
    @FocusState private var isFocused: Bool
    init(viewModel: RegistrationViewModel) {
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
                
                Text("Регистрация")
                    .bold()
                    .font(.title)
                    .padding(.horizontal)
//                TextField(LocalizedStringKey("Имя и фамилия"), text: username)
//                    .padding(12)
//                    .background(
//                        RoundedRectangle(cornerRadius: 10)
//                            .fill(Color(.systemGray6))
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(isFocused ? Color.blue : Color.clear, lineWidth: 1)
//                            )
//                    )
                
                
                TextField(LocalizedStringKey("email"), text: username)
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.systemGray6))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(isFocused ? Color.blue : Color.clear, lineWidth: 1)
                            )
                    )
                
                TextField(LocalizedStringKey("Password"), text: password)
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
                    viewModel.handle(.register)
                } label: {
                    Text(LocalizedStringKey("Создать аккаунт"))
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                
                
                HStack {
                    Text("Haven't any account?")
                    Button {
                        viewModel.handle(.loginTapped)
                    } label: {
                        Text("Sign Up")
                    }
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
