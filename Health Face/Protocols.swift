//
//  Protocols.swift
//  Health Face
//
//  Created by Damir Aushenov on 24/12/25.
//

import Foundation


public protocol HealthRepository {
     func fetchHealth(for city: String) async throws -> [HealthEntry]
}

public protocol HealthDataSource {
     func fetchHealth(for city: String) async throws -> [HealthEntry]
}


// MARK: move out



protocol Routable: Hashable, Identifiable {}

extension Routable {
    var id: String {
        String(describing: self)
    }
}

protocol Coordinator: ObservableObject where Screen: Routable {
    associatedtype Screen
    var navigationPath: [Screen] { get }
}
