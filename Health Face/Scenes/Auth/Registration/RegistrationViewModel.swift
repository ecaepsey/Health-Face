//
//  RegistrationViewModel.swift
//  Health Face
//
//  Created by Damir Aushenov on 10/1/26.
//

import Foundation

class RegistrationViewModel: ViewModel {
    struct RegistrationViewState: Equatable {
        var username = ""
        var password = ""

        var isLoading = false
        var loginError: String?

        var isLogInDisabled: Bool {
            username.isEmpty || password.isEmpty
        }

        var isLoginErrorShowing: Bool {
            loginError != nil && isLoading == false
        }
    }
    
    enum RegistrationViewEvent {
       case loginTapped
    }
    
    func handle(_ event: RegistrationViewEvent) {
        switch event {
        case .loginTapped:
            coordinator.showLogin()
        }
    }
    private let coordinator: AuthCoordinatorProtocol
    
    init(coordinator: AuthCoordinatorProtocol) {
        state = .init()
        self.coordinator = coordinator
    }
    
    @Published private(set) var state: RegistrationViewState
    
    
}
