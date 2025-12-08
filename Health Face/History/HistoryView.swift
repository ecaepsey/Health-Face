//
//  HistoryView.swift
//  Health Face
//
//  Created by Damir Aushenov on 21/11/25.
//

import SwiftUI
    
struct HistoryView: View {
    @ObservedObject var viewModel: NewEntryViewModel
    @State private var selectedEntries: [HealthEntry] = []
    @State private var showCompare = false
    var body: some View {
        
        NavigationStack {
            
            List {
                ForEach(viewModel.entries) { entry in
                    
                    VStack {
                        HStack {
                            Text("\(entry.date)")
                            entryImage(entry)
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
                viewModel.load() // каждый раз перечитываем файл
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
    
    @ViewBuilder
       private func entryImage(_ entry: HealthEntry) -> some View {
           if let fileName = entry.imagePath,
              let uiImage = loadImage(fileName: fileName) {
               Image(uiImage: uiImage)
                   .resizable()
                   .scaledToFit()
                   .cornerRadius(12)
           } else {
               ZStack {
                   RoundedRectangle(cornerRadius: 12)
                       .stroke(.gray.opacity(0.4), style: StrokeStyle(lineWidth: 1, dash: [5]))
                   Text("Нет фото")
                       .font(.caption)
                       .foregroundColor(.secondary)
               }
           }
       }
    
    private func loadImage(fileName: String) -> UIImage? {
           let docsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
           let fileURL = docsURL.appendingPathComponent(fileName)
           return UIImage(contentsOfFile: fileURL.path)
       }
}



func getDate() -> String {
    let date = Date()
    let df = DateFormatter()
    df.dateFormat = "yyyy-MM-dd"
    let dateString = df.string(from: date)
    return dateString
}

