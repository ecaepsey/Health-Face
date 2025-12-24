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
        VStack {
            Stepper("Сон: \(viewModel.sleep)", value: $viewModel.sleep, in: 0...10)
            Stepper("Отёчность: \(viewModel.puffiness)", value: $viewModel.puffiness, in: 0...10)
            TextField("Кожа", text: $viewModel.skinCondition)
                .padding(10)
                               .overlay(
                                   RoundedRectangle(cornerRadius: 7)
                                    .stroke(.secondary.opacity(0.5), lineWidth: 0.5))
            TextField("Заметки", text: $viewModel.notes)
                .padding(10)
                               .overlay(
                                   RoundedRectangle(cornerRadius: 7)
                                    .stroke(.secondary.opacity(0.5), lineWidth: 0.5))
            Button {
                viewModel.save()
            } label: {
                Text("Сохранить запись")
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


