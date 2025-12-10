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
        ZStack {
            Color.gray.ignoresSafeArea() 
            TabView {
                CameraView(newEntryVM: newEntryVM)
                    .tabItem {
                        Label("Camera", systemImage: "camera")
                    }
                CheckListScreen(viewModel: newEntryVM)
                    .tabItem {
                        Label("Чек лист", systemImage: "figure.strengthtraining.traditional")
                    }
                
                HistoryView(viewModel: newEntryVM)
                    .tabItem {
                        Label("История", systemImage: "chart.line.uptrend.xyaxis")
                    }
                
                
                
            }
            .tint(.green)
           
        }
    }
    
    

    
   
}

#Preview {
    ContentView()
}
