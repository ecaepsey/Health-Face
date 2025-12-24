//
//  HomeCoordinatorView.swift
//  Health Face
//
//  Created by Damir Aushenov on 25/12/25.
//



import SwiftUI

struct HomeCoordinatorView: View {

    private let factory: HomeCoordinatorFactory
    @ObservedObject private var coordinator: HomeCoordinator

    init(_ coordinator: HomeCoordinator, factory: HomeCoordinatorFactory) {
        self.factory = factory
        self.coordinator = coordinator
    }

    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            factory.makeHomeView(coordinator: coordinator)
                .navigationDestination(for: HomeCoordinator.Screen.self) {_ in 
                    
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
