//
//  AuthCoordinatorView.swift
//  Health Face
//
//  Created by Damir Aushenov on 4/1/26.
//

import SwiftUI

struct AuthCoordinatorView: View {

    private let factory: AuthCoordinatorFactory
    @ObservedObject private var coordinator: AuthCoordinator

    init(_ coordinator: AuthCoordinator, factory: AuthCoordinatorFactory) {
        self.factory = factory
        self.coordinator = coordinator
    }

    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            factory.makeLoginView(coordinator: coordinator)
                .navigationDestination(for: AuthCoordinator.Screen.self) {
                    destination($0)
                }
        }
    }

    @ViewBuilder
    private func destination(_ screen: AuthCoordinator.Screen) -> some View {
        switch screen {
        case .login:
            factory.makeLoginView(coordinator: coordinator)
            
        case .registration:
            factory.makeRegistrationView(coordinator: coordinator)

        }
    }
}
