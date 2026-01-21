//
//  SettingsView.swift
//  Health Face
//
//  Created by Damir Aushenov on 17/1/26.
//

import SwiftUI
import FirebaseAuth

struct SettingsView: View {
    
    @StateObject private var viewModel: SettingsViewModel

       init(viewModel: SettingsViewModel) {
           _viewModel = StateObject(wrappedValue: viewModel)
       }
    
    var body: some View {
        VStack {
            List {
                Button("Выйти") {
                    viewModel.handle(.logOutTapped)
                }
                
                NavigationLink("Настройки", value: SettingsCoordinator.Screen.reminder)
            }
        }
    }
}
