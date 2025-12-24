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
        
    public func fetchHealth(for city: String, completion: @escaping (Result<[HealthEntry], Error>) -> Void) {
        dataSource.fetchHealth(for: city, completion: completion)
    }
}



