//
//  FetchHealthUseCase.swift
//  Health Face
//
//  Created by Damir Aushenov on 24/12/25.
//


public class FetchHealthUseCase {
    private let repository: HealthRepository
    
    public init(repository: HealthRepository) {
        self.repository = repository
    }
    
    public func fetchHealth(for city: String) async throws -> [HealthEntry] {
        try await repository.fetchHealth(for: city)
    }
}
