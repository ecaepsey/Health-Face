//
//  HealthRepositoryImpl.swift
//  Health Face
//
//  Created by Damir Aushenov on 24/12/25.
//

import Foundation



public class HealthRepositoryImpl: HealthRepository {
    private let dataSource: HealthDataSource
   
    
    public init(dataSource: HealthDataSource) {
        self.dataSource = dataSource
      
    }
        
    public func fetchHealth(for city: String) async throws -> [HealthEntry] {
       try await self.dataSource.fetchHealth(for: city)
    }
    
    public func save(_ items: [HealthEntry], _ id: String) {
        self.dataSource.save(items, id)
    }
    
    
}



