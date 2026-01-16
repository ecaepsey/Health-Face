//
//  AppCoordinator.swift
//  Health Face
//
//  Created by Damir Aushenov on 25/12/25.
//

import Foundation
import FirebaseAuth


@MainActor
final class AppCoordinator: ObservableObject {

    enum State {
        case idle
        case auth
        case main
        case loading
    }

    enum Action {
        case showAuth
        case showMain
        case checkAuthorization
        
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
        case .checkAuthorization:
            Task { await loadData() }
      
        case .showMain:
            state = .main
            
        case .showAuth:
                    state = .auth
        }
        
        
    }
}

private extension AppCoordinator {

    func loadData() async {
        state = .loading

        do {
           let token = try await Auth.auth().currentUser?.getIDToken()
            state = .main
        } catch {
            state = . auth
        }
    }
}
