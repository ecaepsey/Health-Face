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
    
    public func execute(city: String, completion: @escaping (Result<[HealthEntry], Error>) -> Void) {
        repository.fetchHealth(for: city, completion: completion)
    }
}
