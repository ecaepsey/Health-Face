//
//  RegistrationView.swift
//  Health Face
//
//  Created by Damir Aushenov on 10/1/26.
//

import SwiftUI


struct RegistrationView: View {
    
    @StateObject private var viewModel: RegistrationViewModel
    
    
    init(viewModel: RegistrationViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        ZStack {
            Text("Registration")
        }
    }
}
