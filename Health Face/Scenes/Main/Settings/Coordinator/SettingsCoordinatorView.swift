//
//  SettingsCoordinatorView.swift
//  Health Face
//
//  Created by Damir Aushenov on 17/1/26.
//

import SwiftUI


struct SettingsCoordinatorView: View {
    private let factory: SettingsCoordinatorFactory
    @ObservedObject private var coordinator: SettingsCoordinator
    
    init(factory: SettingsCoordinatorFactory, coordinator:  SettingsCoordinator   ) {
        self.factory = factory
        self.coordinator = coordinator
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            factory.makeScreenView(coordinator: coordinator)
        }
    }
}
