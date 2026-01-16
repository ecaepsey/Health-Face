//
//  AppCoordinatorView.swift
//  Health Face
//
//  Created by Damir Aushenov on 25/12/25.
//

import Foundation


import SwiftUI

struct AppCoordinatorView: View {

    private let screenFactory: ScreenFactory
    @ObservedObject private var coordinator: AppCoordinator

    init(screenFactory: ScreenFactory, coordinator: AppCoordinator) {
        self.screenFactory = screenFactory
        self.coordinator = coordinator
    }

    var body: some View {
        sceneView
            .onAppear {
                coordinator.handle(.checkAuthorization)
            }
    }

    @ViewBuilder
    private var sceneView: some View {
        switch coordinator.state {
        case .idle:
            EmptyView()
            
        case .loading:
            ProgressView()
                .tint(.blue)
            
        case .auth:
            AuthCoordinatorView(
                AuthCoordinator(showMainSceneHandler: { coordinator.handle(.showMain) }),
                factory: screenFactory
            )
            
        case .main:
            MainCoordinatorView(
                factory: screenFactory,
                showAuthSceneHandler: { coordinator.handle(.showMain) }
            )
            
        }
    }
}
