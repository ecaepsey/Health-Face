//
//  RegistrationViewModel.swift
//  Health Face
//
//  Created by Damir Aushenov on 10/1/26.
//

import Foundation

class RegistrationViewModel: ViewModel {
    struct RegistrationViewState: Equatable {
       
    }
    
    enum RegistrationViewEvent {
       
    }
    
    func handle(_ event: RegistrationViewEvent) {
       
    }
    private let coordinator: AuthCoordinatorProtocol
    
    init(coordinator: AuthCoordinatorProtocol) {
        state = .init()
        self.coordinator = coordinator
    }
    
    @Published private(set) var state: RegistrationViewState
    
    
}
