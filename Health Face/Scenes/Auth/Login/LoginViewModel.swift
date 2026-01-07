//
//  LoginViewModel.swift
//  Health Face
//
//  Created by Damir Aushenov on 4/1/26.
//

import Foundation

import Foundation

@MainActor
protocol ViewModel<State, Event>: ObservableObject where State: Equatable {
    associatedtype State
    associatedtype Event

    var state: State { get }

    func handle(_ event: Event)
}


final class LoginViewModel: ViewModel {
    struct LoginViewState: Equatable {
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

    @Published private(set) var state: LoginViewState
    private let coordinator: AuthCoordinatorProtocol
    
    init(coordinator: AuthCoordinatorProtocol) {
        state = .init()
        self.coordinator = coordinator
    }
    
    func handle(_ event: LoginViewEvent) {
        switch event {
            
        case .usernameChanged(let login):
                    state.username = login
                    
                case .passwordChanged(let password):
                    state.password = password
        case .logInTapped:
            coordinator.showMainScene()
        }
       }
}


enum LoginViewEvent {
    case usernameChanged(String)
    case passwordChanged(String)
    case logInTapped
}
