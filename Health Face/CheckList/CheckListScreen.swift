//
//  CheckListScreen.swift
//  Health Face
//
//  Created by Damir Aushenov on 20/11/25.
//

import SwiftUI



struct CheckListScreen: View {
    
    @ObservedObject var viewModel: NewEntryViewModel
    var body: some View {
        let sleep = String(describing: viewModel.sleep)
        let puffiness = String(describing: viewModel.puffiness)
        VStack {
            Stepper(LocalizedStringKey("CheckListScreen.sleep.text".localized(with: [sleep])), value: $viewModel.sleep, in: 0...10)
            Stepper(LocalizedStringKey("CheckListScreen.hydration.text".localized(with: [puffiness])), value: $viewModel.puffiness, in: 0...10)
            TextField(LocalizedStringKey("CheckListScreen.skin.text"), text: $viewModel.skinCondition)
                .padding(10)
                               .overlay(
                                   RoundedRectangle(cornerRadius: 7)
                                    .stroke(.secondary.opacity(0.5), lineWidth: 0.5))
            TextField(LocalizedStringKey("CheckListScreen.notes.text"), text: $viewModel.notes)
                .padding(10)
                               .overlay(
                                   RoundedRectangle(cornerRadius: 7)
                                    .stroke(.secondary.opacity(0.5), lineWidth: 0.5))
            Button {
                viewModel.save()
            } label: {
                Text(LocalizedStringKey("CheckListScreen.saveNotes.text"))
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.horizontal)
            }
        }
        .padding()
//        .alert(isPresented: $viewModel.showAlert) {
//                    switch viewModel.activeAlert {
//                    case .dataCreated:
//                        Alert(
//                            title: Text("User successfully created."),
//                            message: Text("Please login."),
//                            dismissButton: .cancel(Text("Done"), action: {
//                               
//                            })
//                        )
//                    case .emptyInfo:
//                        Alert(title: Text(viewModel.errorMessage))
//                    case .dataNotCreated:
//                        Alert(title: Text(viewModel.errorMessage))
//                    }
//                }
    }
}


