//
//  LoginUseCase.swift
//  Health Face
//
//  Created by Damir Aushenov on 13/1/26.
//

import Foundation


final class LoginUseCase {
    private let authRepository: AuthRepository
    
    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    func execute(email: String, password: String) async throws {
        let credentials = LoginCredentials(email: email, password: password)
        try await authRepository.logIn(credentials: credentials)
    }
}
