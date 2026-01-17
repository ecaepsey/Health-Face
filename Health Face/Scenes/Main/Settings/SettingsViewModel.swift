//
//  SettingsViewModel.swift
//  Health Face
//
//  Created by Damir Aushenov on 18/1/26.
//

import Foundation
import FirebaseAuth

final class SettingsViewModel: ViewModel {
    @Published private(set) var state: SettingsViewState
    
    private let coordinator: SettingsCoordinatorProtocol
    
    init(    coordinator: SettingsCoordinatorProtocol) {
        
        state = .idle
        self.coordinator = coordinator
    }
    
    func handle(_ event: SettingsViewEvent) {
        switch event {
        case .logOutTapped:
            Task { await logOut() }
        }
    }
    
    func logOut() async {
        do {
            try Auth.auth().signOut()
            coordinator.showAuthScene()
        } catch {
            
        }
    }
}


enum SettingsViewEvent {
    case logOutTapped
}

enum SettingsViewState {
    case idle
}
