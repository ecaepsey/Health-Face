//
//  ContentView.swift
//  Health Face
//
//  Created by Damir Aushenov on 18/11/25.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
   
    var body: some View {
        TabView {
            CameraView()
                .tabItem {
                    Label("Camera", systemImage: "camera")
                }
            CheckListScreen()
                .tabItem {
                    Label("Чек лист", systemImage: "square.and.pencil")
                }
            
            HistoryView()
                .tabItem {
                    Label("История", systemImage: "clock")
                }
        }
    }
    
    

    
   
}

#Preview {
    ContentView()
}
