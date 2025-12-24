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
    
    @StateObject  var viewModel: HistoryViewModel
        
        init(viewModel: HistoryViewModel) {
            _viewModel = StateObject(wrappedValue: viewModel)
        }
    
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea() 
            TabView {
                CameraView(newEntryVM: newEntryVM)
                    .tabItem {
                        Label("Camera", systemImage: "camera")
                    }
                
                
                HistoryView(viewModel: viewModel)
                    .tabItem {
                        Label("История", systemImage: "chart.line.uptrend.xyaxis")
                    }
                
                
                
            }
            .tint(.green)
           
        }
    }
    
    

    
   
}

