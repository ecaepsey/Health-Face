//
//  AuthRepository.swift
//  Health Face
//
//  Created by Damir Aushenov on 11/1/26.
//

import Foundation

protocol AuthRepository {
//    func logOut() async throws
    func register(user: UserRegister) async throws
//    func logIn(credentials: LoginCredentials) async throws
}
