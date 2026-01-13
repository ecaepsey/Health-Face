//
//  AuthRepositoryImpl.swift
//  Health Face
//
//  Created by Damir Aushenov on 11/1/26.
//

import Foundation
import FirebaseAuth

final class AuthRepositoryImpl: AuthRepository {
    func logIn(credentials: LoginCredentials) async throws {
        try await Auth.auth().signIn(withEmail: credentials.email, password: credentials.password)
    }
    
    func register(user: UserRegister) async throws {
        print("register")
        let userDto = UserRegisterDTO(password: user.password, email: user.email)
        print("register,user", userDto)
        try await Auth.auth().createUser(withEmail: userDto.email, password: userDto.password)
    }
}

struct UserRegisterDTO {
    
    let password: String
    let email: String
   
   
}
