//
//  HistoryCoordinatorView.swift
//  Health Face
//
//  Created by Damir Aushenov on 25/12/25.
//

import Foundation

import SwiftUI

struct HistoryCoordinatorView: View {

    private let factory: HistoryCoordinatorFactory
    @ObservedObject private var coordinator: HistoryCoordinator

    init(_ coordinator: HistoryCoordinator, factory: HistoryCoordinatorFactory) {
        self.factory = factory
        self.coordinator = coordinator
    }

    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            factory.makeHistoryView(coordinator: coordinator)
                .navigationDestination(for: HistoryCoordinator.Screen.self) {_ in
                    
                }
        }
    }

//    @ViewBuilder
//    private func destination(_ screen: HomeCoordinator.Screen) -> some View {
//        switch screen {
//        case .movieDetails(let movieId):
//            factory.makeMovieDetailsView(
//                movieId: movieId,
//                showAuthSceneHandler: { coordinator.showAuthScene() }
//            )
//        }
//    }
}
