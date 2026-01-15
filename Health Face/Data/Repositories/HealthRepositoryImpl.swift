//
//  HealthRepositoryImpl.swift
//  Health Face
//
//  Created by Damir Aushenov on 24/12/25.
//

import Foundation



public class HealthRepositoryImpl: HealthRepository {
    private let dataSource: HealthDataSource
    private let storageServce: StorageService<HealthEntry>
    
    public init(dataSource: HealthDataSource, storageServce: StorageService<HealthEntry>) {
        self.dataSource = dataSource
        self.storageServce = storageServce
    }
        
    public func fetchHealth(for city: String) async throws -> [HealthEntry] {
       try await self.dataSource.fetchHealth(for: city)
    }
    
    
}



