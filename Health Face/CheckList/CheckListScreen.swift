//
//  CheckListScreen.swift
//  Health Face
//
//  Created by Damir Aushenov on 20/11/25.
//

import SwiftUI



struct CheckListScreen: View {
    
    @ObservedObject var viewModel: CameraViewModel
    var body: some View {
        let sleep = String(describing: viewModel.state.sleep)
        let puffiness = String(describing: viewModel.state.puffiness)
        VStack {
            Stepper(LocalizedStringKey("CheckListScreen.sleep.text".localized(with: [sleep])), value: $viewModel.state.sleep, in: 0...10)
            Stepper(LocalizedStringKey("CheckListScreen.hydration.text".localized(with: [puffiness])), value: $viewModel.state.puffiness, in: 0...10)
            TextField(LocalizedStringKey("CheckListScreen.skin.text"), text: $viewModel.state.skinCondition)
                .padding(10)
                               .overlay(
                                   RoundedRectangle(cornerRadius: 7)
                                    .stroke(.secondary.opacity(0.5), lineWidth: 0.5))
            TextField(LocalizedStringKey("CheckListScreen.notes.text"), text: $viewModel.state.notes)
                .padding(10)
                               .overlay(
                                   RoundedRectangle(cornerRadius: 7)
                                    .stroke(.secondary.opacity(0.5), lineWidth: 0.5))
            Button {
                viewModel.handle(.save)
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


