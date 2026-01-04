//
//  AppCoordinator.swift
//  Health Face
//
//  Created by Damir Aushenov on 25/12/25.
//

import Foundation




@MainActor
final class AppCoordinator: ObservableObject {

    enum State {
        case idle
        case auth
        case main
    }

    enum Action {
        case showAuth
        case showMain
        
    }

    @Published private(set) var state: State

    private let fetchHealthUseCase: FetchHealthUseCase
    
    init(
        fetchHealthUseCase: FetchHealthUseCase
       
    ) {
        state = .idle
        self.fetchHealthUseCase = fetchHealthUseCase
        
    }

    func handle(_ action: Action) {
        switch action {
      
        case .showMain:
            state = .main
            
        case .showAuth:
                    state = .auth
        }
        
        
    }
}

private extension AppCoordinator {

    func loadData() async {
        state = .auth

        do {
           
            state = .main
        } catch {
            state = .idle
        }
    }
}
