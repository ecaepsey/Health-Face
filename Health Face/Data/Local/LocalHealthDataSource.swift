//
//  LocalHealthDataSource.swift
//  Health Face
//
//  Created by Damir Aushenov on 24/12/25.
//

import Foundation



public class LocalHealthDataSource: HealthDataSource {
    private let jsonLoader: JSONLoaderProtocol
    
    
    public init(jsonLoader: JSONLoaderProtocol) {
        self.jsonLoader = jsonLoader
        
    }
    
    
    
   
    
    public func fetchHealth(for city: String) async throws -> [HealthEntry] {
        guard let data = jsonLoader.loadJSON(filename: "health_entries.json") else {
            throw NSError(
                domain: "",
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: "Failed to load local data"]
            )
        }

        do {
            let health = try JSONDecoder().decode([HealthEntry].self, from: data)
            print(health)
            return health
        } catch {
            throw error
        }
    }
}

public protocol JSONLoaderProtocol {
    func loadJSON(filename: String) -> Data?
}

public protocol ConfigurationProtocol {
    var baseURL: String { get }
    var apiKey: String { get }
    var localWeatherDataFilename: String { get }
}

final public class JSONLoader: JSONLoaderProtocol {
    public func loadJSON(filename: String) -> Data? {
        let url = documentsURL.appendingPathComponent(filename)

        do {
            return try Data(contentsOf: url)
        } catch {
            print("Error loading JSON from Documents: \(error)")
            return nil
        }
    }

    private var documentsURL: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
}
