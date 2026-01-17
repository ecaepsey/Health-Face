//
//  LocalHealthDataSource.swift
//  Health Face
//
//  Created by Damir Aushenov on 24/12/25.
//

import Foundation
import FirebaseAuth

public enum HealthStorageError: Error {
    case notLoggedIn
    case fileNotFound
    case decodeFailed
    case encodeFailed
}

public class LocalHealthDataSource: HealthDataSource {
    private let jsonLoader: JSONLoaderProtocol
    private let fm: FileManager = .default
    private let decoder = JSONDecoder()
    
    
    public init(jsonLoader: JSONLoaderProtocol) {
        self.jsonLoader = jsonLoader
        
    }
    
    func fileURL(uid: String) throws -> URL {
        try userDir(uid: uid).appendingPathComponent("health_entries.json")
       
    }
    
    private func userDir(uid: String) throws -> URL {
            let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let dir = docs.appendingPathComponent("users/\(uid)", isDirectory: true)
            try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
            return dir
        }
    
  
    public func save(_ items: [HealthEntry], _ id: String) {
        do {
            let data = try JSONEncoder().encode(items)
            let url = try fileURL(uid: id)
            try data.write(to: url, options: .atomic)
        } catch {
            print("Error saving:", error)
        }
    }
    private func currentUID() throws -> String {
           guard let uid = Auth.auth().currentUser?.uid else {
               throw HealthStorageError.notLoggedIn
           }
           return uid
       }
    
   
   
    
    public func fetchHealth(for city: String) async throws -> [HealthEntry] {
        let uid = try currentUID()
        let url = try fileURL(uid: uid)

             guard fm.fileExists(atPath: url.path) else {
                 // If you prefer: return [] instead of throwing
                 return []
                 // throw HealthStorageError.fileNotFound
             }

             do {
                 let data = try Data(contentsOf: url)
                 return try decoder.decode([HealthEntry].self, from: data)
             } catch {
                 throw HealthStorageError.decodeFailed
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
