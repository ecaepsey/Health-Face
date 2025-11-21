//
//  HistoryViewModel.swift
//  Health Face
//
//  Created by Damir Aushenov on 21/11/25.
//

import Foundation


class HistoryViewModel: ObservableObject {
    @Published var entries: [HealthEntry] = []
    let healthStorage = StorageService<HealthEntry>(fileName: "health_entries.json")
    
    init() {
        load()
        
        
    }
    
    func load() {
        entries = healthStorage.load()
    }
    
}
