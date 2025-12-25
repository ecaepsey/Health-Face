//
//  HistoryView.swift
//  Health Face
//
//  Created by Damir Aushenov on 21/11/25.
//

import SwiftUI

struct HistoryPhoto: Identifiable {
    let id = UUID()
    let image: UIImage
}
    
struct HistoryView: View {
   
    @State private var selectedEntries: [HealthEntry] = []
    @State private var showCompare = false
    @State private var selectedPhoto: HistoryPhoto?
    
    @StateObject private var viewModel: HistoryViewModel
       
       init(viewModel: HistoryViewModel) {
           _viewModel = StateObject(wrappedValue: viewModel)
       }
   
    var body: some View {
        
        NavigationStack {
            Text("Выберите две фотографии для сравнения")
                .font(.headline)
                .background(.clear)
            List {
               
                ForEach(viewModel.entries) { entry in
                    let isSelected = selectedEntries.contains(entry)

                 
                        HStack {
                            entryImage(entry)
                            Text(getDate(entry.date))
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                            
                            
                            Spacer()
                            Text("сон: \(String(describing: entry.sleepQuality)), отечность:  \(String(describing: entry.puffiness))")
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                        }
//                        SelectEntryButton(
//                            isSelected: selectedEntries.contains(entry)
//                        ) {
//                            toggleSelection(for: entry)
//                        }
                        .padding() // ✅ внутренний отступ для контента
                              .background(
                                  RoundedRectangle(cornerRadius: 10)
                                      .stroke(
                                          isSelected ? Color.green : Color.gray.opacity(0),
                                          lineWidth: isSelected ? 2 : 1
                                      )
                              )
                              .contentShape(Rectangle())
                              .onTapGesture {
                                  toggleSelection(for: entry)
                              }
                              // ✅ ВОТ ЭТИ ДВЕ СТРОКИ ДЕЛАЮТ БОРДЕР ПО КРАЯМ ROW:
                              .listRowInsets(EdgeInsets())       // убираем системные отступы List
                              .listRowSeparator(.hidden)         // убираем стандартный сепаратор
                              
                     
                        
                        
                    }
                    
                    
                    .fullScreenCover(item: $selectedPhoto) { item in
                                ZoomableImageView(image: item.image)
                            }
                   
                                      
                                      
                
                
                
                
               
            }
            .onAppear {
                viewModel.fetchHealth(for: "")
                    }
            .listRowSpacing(10)
            .navigationTitle("")
                     .toolbar {
                         if selectedEntries.count == 2 {
                             Button("Сравнить") {
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
                   .scaledToFill()
                   
                   .frame(width: 80, height: 80)
                       .clipShape(Circle())      // вместо cornerRadius
                   .onTapGesture {
                       selectedPhoto = HistoryPhoto(image: uiImage)
                                       }
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



func getDate(_ date: Date) -> String {
    let df = DateFormatter()
    df.dateFormat = "YYYY:MM:dd"
    let dateString = df.string(from: date)
    return dateString
}


struct ZoomableImageView: View {
    let image: UIImage

    @Environment(\.dismiss) private var dismiss
    @State private var scale: CGFloat = 1.0
    @State private var lastScale: CGFloat = 1.0

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.black.ignoresSafeArea()

            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .scaleEffect(scale)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            scale = lastScale * value
                        }
                        .onEnded { _ in
                            lastScale = scale
                        }
                )

            Button(action: {
                dismiss()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 28))
                    .foregroundColor(.black)
                    .padding()
            }
        }
    }
}
