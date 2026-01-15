//
//  HomeCoordinator.swift
//  Health Face
//
//  Created by Damir Aushenov on 25/12/25.
//

import Foundation



final class HomeCoordinator: Coordinator {
    
    enum Screen: Routable {
        case movieDetails(String)
    }
    
    @Published var navigationPath = [Screen]()
    private let showAuthSceneHandler: () -> Void
    
    init(showAuthSceneHandler: @escaping () -> Void) {
        self.showAuthSceneHandler = showAuthSceneHandler
    }
}

extension HomeCoordinator: HomeCoordinatorProtocol {
      
    
}
