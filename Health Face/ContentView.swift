//
//  ContentView.swift
//  Health Face
//
//  Created by Damir Aushenov on 18/11/25.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @StateObject private var newEntryVM = NewEntryViewModel()
    var body: some View {
        TabView {
            CameraView(newEntryVM: newEntryVM)
                .tabItem {
                    Label("Camera", systemImage: "camera")
                }
            CheckListScreen(viewModel: newEntryVM)
                .tabItem {
                    Label("Чек лист", systemImage: "square.and.pencil")
                }
            
            HistoryView(viewModel: newEntryVM)
                .tabItem {
                    Label("История", systemImage: "clock")
                }
            
           
        }
    }
    
    

    
   
}

#Preview {
    ContentView()
}
