//
//  HistoryView.swift
//  Health Face
//
//  Created by Damir Aushenov on 21/11/25.
//

import SwiftUI

struct HistoryView: View {
    @StateObject var viewModel = HistoryViewModel()
    @State private var selectedEntries: [HealthEntry] = []
    @State private var showCompare = false
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(viewModel.entries) { entry in
                    
                    VStack {
                        HStack {
                            Text("\(entry.date)")
                            Image(systemName: "photo")
                            Spacer()
                            Text("Сон: 2, Отечность: 5")
                        }
                        SelectEntryButton(
                            isSelected: selectedEntries.contains(entry)
                        ) {
                            toggleSelection(for: entry)
                        }
                    }
                   
                                      
                                      
                }
                
                
                
               
            }
            .onAppear {
                        viewModel.load()   // каждый раз перечитываем файл
                    }
            .listRowSpacing(10)
            .navigationTitle("History")
                     .toolbar {
                         if selectedEntries.count == 2 {
                             Button("Compare") {
                                 showCompare = true
                             }
                         }
                     }
                     .navigationDestination(isPresented: $showCompare) {
                         if selectedEntries.count == 2 {
                             CompareView(
                                 first: selectedEntries[0],
                                 second: selectedEntries[1]
                             )
                         }
                     }
            
           
            
        }
    }
    
    private func toggleSelection(for entry: HealthEntry) {
           if selectedEntries.contains(entry) {
               selectedEntries.removeAll { $0 == entry }
           } else {
               if selectedEntries.count < 2 {
                   selectedEntries.append(entry)
               } else {
                   // если уже выбрано 2 — можно, например, заменить первую
                   selectedEntries[0] = selectedEntries[1]
                   selectedEntries[1] = entry
               }
           }
       }
}



func getDate() -> String {
    let date = Date()
    let df = DateFormatter()
    df.dateFormat = "yyyy-MM-dd"
    let dateString = df.string(from: date)
    return dateString
}


#Preview {
    HistoryView()
}
