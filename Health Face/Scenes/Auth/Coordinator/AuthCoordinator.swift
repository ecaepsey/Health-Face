//
//  AuthCoordinator.swift
//  Health Face
//
//  Created by Damir Aushenov on 4/1/26.
//

import SwiftUI

final class AuthCoordinator: Coordinator {

    enum Screen: Routable {
        case login
       
       
    }

    @Published var navigationPath = [Screen]()
    private let showMainSceneHandler: () -> Void

    init(showMainSceneHandler: @escaping () -> Void) {
        self.showMainSceneHandler = showMainSceneHandler
    }
}

extension AuthCoordinator: AuthCoordinatorProtocol {

    func showMainScene() {
        showMainSceneHandler()
    }

    func showLogin() {
        updatePathForLogin()
        navigationPath.append(.login)
    }

    
}

private extension AuthCoordinator {

    func updatePathForPersonalInfoRegistration() {
        if case .login = navigationPath.last {
            navigationPath.removeLast()
        }
    }

    func updatePathForLogin() {
        switch navigationPath.last {
       

        default: break
        }
    }
}
