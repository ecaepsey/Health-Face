//
//  LoginView.swift
//  Health Face
//
//  Created by Damir Aushenov on 4/1/26.
//

import SwiftUI


struct LoginView: View {
    @StateObject private var viewModel: LoginViewModel
       
       init(viewModel: LoginViewModel) {
           _viewModel = StateObject(wrappedValue: viewModel)
       }
    
    var body: some View {
        Text("Hello")
    }
    
    
}
