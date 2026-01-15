//
//  AppFactory.swift
//  Health Face
//
//  Created by Damir Aushenov on 25/12/25.
//

import Foundation



final class AppFactory {
    
    private lazy var authRepository = AuthRepositoryImpl(
           
       )
    private lazy var healthRepository: HealthRepositoryImpl = {
        let localDataSource = LocalHealthDataSource(jsonLoader: JSONLoader())
       
        return HealthRepositoryImpl(dataSource: localDataSource)
    }()
}

// MARK: - Profile

extension AppFactory {
    func makeFetchHealthUseCase() -> FetchHealthUseCase {
        FetchHealthUseCase(repository: healthRepository)
    }
    
    func makeRegisterUserUseCase() -> RegisterUserUseCase {
           RegisterUserUseCase(authRepository: authRepository)
       }
    
    func makeLoginUseCase() -> LoginUseCase {
        LoginUseCase(authRepository: authRepository)
       }
}


