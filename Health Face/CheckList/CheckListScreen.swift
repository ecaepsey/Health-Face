//
//  CheckListScreen.swift
//  Health Face
//
//  Created by Damir Aushenov on 20/11/25.
//

import SwiftUI



struct CheckListScreen: View {
    
    @StateObject var viewModel = CheckListViewModel()
    var body: some View {
        VStack {
            TextField("Сон", value: $viewModel.sleepQuality, format: .number)
                .padding(10)
                               .overlay(
                                   RoundedRectangle(cornerRadius: 7)
                                    .stroke(.secondary.opacity(0.5), lineWidth: 0.5))
            TextField("Отечность", value: $viewModel.puffiness, format: .number)
                .padding(10)
                               .overlay(
                                   RoundedRectangle(cornerRadius: 7)
                                    .stroke(.secondary.opacity(0.5), lineWidth: 0.5))
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
                viewModel.createCheckTapped()
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
        .alert(isPresented: $viewModel.showAlert) {
                    switch viewModel.activeAlert {
                    case .dataCreated:
                        Alert(
                            title: Text("User successfully created."),
                            message: Text("Please login."),
                            dismissButton: .cancel(Text("Done"), action: {
                               
                            })
                        )
                    case .emptyInfo:
                        Alert(title: Text(viewModel.errorMessage))
                    case .dataNotCreated:
                        Alert(title: Text(viewModel.errorMessage))
                    }
                }
    }
}

#Preview {
    CheckListScreen()
}
