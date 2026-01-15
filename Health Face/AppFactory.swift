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
        let storage = StorageService<HealthEntry>(fileName: "health_entries.json")
        return HealthRepositoryImpl(dataSource: localDataSource, storageServce: storage)
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


