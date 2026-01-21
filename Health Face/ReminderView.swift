//
//  ReminderView.swift
//  Health Face
//
//  Created by Damir Aushenov on 3/12/25.
//

import SwiftUI

struct ReminderView: View {
    @StateObject private var viewModel = ReminderViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            Section(header: Text("Напоминание")) {
                Toggle("Ежедневное напоминание", isOn: $viewModel.isEnabled)
                
                DatePicker(
                    "Время",
                    selection: $viewModel.time,
                    displayedComponents: .hourAndMinute
                )
                .disabled(!viewModel.isEnabled)
            }
            
            Section(footer: Text("В выбранное время тебе придёт пуш, чтобы сделать фото и обновить прогресс.")) {
                EmptyView()
            }
        }
        .navigationTitle("Напоминание")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Готово") {
                    viewModel.save()
                    dismiss()
                }
            }
            
           
        }
    }
}
