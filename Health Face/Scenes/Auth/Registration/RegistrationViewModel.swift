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
        case register
        case usernameChanged(String)
        case passwordChanged(String)
    }
    
    func handle(_ event: RegistrationViewEvent) {
        switch event {
        case .usernameChanged(let login):
                    state.username = login
                    
                case .passwordChanged(let password):
                    state.password = password
        case .loginTapped:
            coordinator.showLogin()
        case .register:
            Task { await self.registerTapped() }
        }
    }
    private let registerUserUseCase: RegisterUserUseCase
    private let coordinator: AuthCoordinatorProtocol
    
    init(coordinator: AuthCoordinatorProtocol,
         registerUserUseCase: RegisterUserUseCase
    
    ) {
        state = .init()
        self.coordinator = coordinator
        self.registerUserUseCase = registerUserUseCase
    }
    
    @Published private(set) var state: RegistrationViewState
    
    func registerTapped() async {
        
           let userRegister = UserRegister(
               
               password: state.password,
               email: state.username
            
           )

           state.isLoading = true
           do {
               print("request")
               try await registerUserUseCase.execute(userRegister)
//               state.registerError = nil
               coordinator.showMainScene()
           } catch {
               print("error", error)
//               state.registerError = LocalizedKey.ErrorMessage.registrationFailed
           }
        print("success")
           state.isLoading = false
       }
    
    
}
