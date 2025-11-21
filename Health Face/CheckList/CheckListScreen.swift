//
//  CheckListScreen.swift
//  Health Face
//
//  Created by Damir Aushenov on 20/11/25.
//

import SwiftUI



struct CheckListScreen: View {
    @State var text = ""
    @StateObject var viewModel = CheckListViewModel()
    var body: some View {
        VStack {
            TextField("Сон", text: $text)
                .padding(10)
                               .overlay(
                                   RoundedRectangle(cornerRadius: 7)
                                    .stroke(.secondary.opacity(0.5), lineWidth: 0.5))
            TextField("Отечность", text: $text)
                .padding(10)
                               .overlay(
                                   RoundedRectangle(cornerRadius: 7)
                                    .stroke(.secondary.opacity(0.5), lineWidth: 0.5))
            TextField("Кожа", text: $text)
                .padding(10)
                               .overlay(
                                   RoundedRectangle(cornerRadius: 7)
                                    .stroke(.secondary.opacity(0.5), lineWidth: 0.5))
            TextField("Заметки", text: $text)
                .padding(10)
                               .overlay(
                                   RoundedRectangle(cornerRadius: 7)
                                    .stroke(.secondary.opacity(0.5), lineWidth: 0.5))
            Button {
                print("hello")
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
    }
}

#Preview {
    CheckListScreen()
}
