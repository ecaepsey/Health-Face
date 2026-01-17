//
//  ScreenFactoryProtocol.swift
//  Health Face
//
//  Created by Damir Aushenov on 17/1/26.
//

import SwiftUI

@MainActor

protocol SettingsViewFactory {
    func makeScreenView(coordinator: SettingsCoordinatorProtocol) -> SettingsView
}

