//
//  ContentView.swift
//  Health Face
//
//  Created by Damir Aushenov on 18/11/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    var body: some View {
        
        ZStack {
                    // Camera image
                    FrameView(image: viewModel.frame)
                        .ignoresSafeArea()

                    // Error banner + camera button overlayed on top
                    VStack {
                        ErrorView(error: viewModel.error)
                        Spacer()
                        ControlView()
                    }
                }
    }
}

#Preview {
    ContentView()
}
