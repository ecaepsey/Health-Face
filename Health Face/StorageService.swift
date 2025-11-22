//
//  StorageService.swift
//  Health Face
//
//  Created by Damir Aushenov on 21/11/25.
//

import Foundation


// Storage
final class StorageService<T: Codable> {
    private let fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    private var fileURL: URL {
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return dir.appendingPathComponent(fileName)
    }
    
    func load() -> [T] {
        guard let data = try? Data(contentsOf: fileURL) else { return [] }
        return (try? JSONDecoder().decode([T].self, from: data)) ?? []
    }
    
    func save(_ items: [T]) {
        do {
            let data = try JSONEncoder().encode(items)
            try data.write(to: fileURL, options: .atomic)
        } catch {
            print("Error saving:", error)
        }
    }
}
