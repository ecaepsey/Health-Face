//
//  SettingsCoordinator.swift
//  Health Face
//
//  Created by Damir Aushenov on 17/1/26.
//

import Foundation


final class SettingsCoordinator: Coordinator {
    enum Screen: Routable {
        case reminder
    }
    
    @Published var navigationPath = [Screen]()
    private let showAuthSceneHandler: () -> Void
    
    init(showAuthSceneHandler: @escaping () -> Void) {
           self.showAuthSceneHandler = showAuthSceneHandler
       }
}


extension SettingsCoordinator: SettingsCoordinatorProtocol {
    func showAuthScene() {
        showAuthSceneHandler()
    }
    
    
}
