//
//  RegisterUserUseCase.swift
//  Health Face
//
//  Created by Damir Aushenov on 11/1/26.
//

import Foundation


final class RegisterUserUseCase {
    private let authRepository: AuthRepository
    
    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    func execute(_ user: UserRegister) async throws {
        try await authRepository.register(user: user)
    }
}
