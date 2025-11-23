//
//  HistoryView.swift
//  Health Face
//
//  Created by Damir Aushenov on 21/11/25.
//

import SwiftUI

struct HistoryView: View {
    @StateObject var viewModel = HistoryViewModel()
    var body: some View {
        
        return VStack {
            List {
                ForEach(viewModel.entries) { entry in
                    HStack {
                        Text("\(entry.date)")
                        Image(systemName: "photo")
                        Spacer()
                        Text("Сон: 2, Отечность: 5")
                    }
                }
                
                
                
               
            }
            .onAppear {
                        viewModel.load()   // каждый раз перечитываем файл
                    }
            .listRowSpacing(10)
            
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
