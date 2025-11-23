//
//  CheckListViewModel.swift
//  Health Face
//
//  Created by Damir Aushenov on 21/11/25.
//

import Foundation

enum ActiveAlert {
    case dataCreated, emptyInfo, dataNotCreated
}

class CheckListViewModel: ObservableObject {
    @Published var sleepQuality: Int = 0
    @Published var puffiness: Int = 0
    @Published var skinCondition: String = ""
    @Published var notes: String = ""
    @Published var showActivity = false
    private(set) var errorMessage = ""
    @Published var activeAlert: ActiveAlert = .dataCreated
    @Published var showAlert = false
    @Published var entries: [HealthEntry] = []
    let storage = StorageService<HealthEntry>(fileName: "health_entries.json")
    
    init() {
            load()
        }

        func load() {
            entries = storage.load()
        }
    
    func createCheckTapped() {
            if sleepQuality != 0,
               puffiness != 0,
               !skinCondition.isEmpty,
               !notes.isEmpty
               {
                
                
                let new = HealthEntry(
                           id: UUID(),
                           date: Date(),
                           puffiness: puffiness,
                           sleepQuality: sleepQuality,
                           skinCondition: skinCondition,
                           notes: notes,
                           imagePath: ""
                       )

                       entries.append(new)
                       storage.save(entries)
                
                
               
            } else {
                self.errorMessage = "Please fill in the information completely."
                self.activeAlert = .emptyInfo
                self.showAlert.toggle()
                
            }
        }
}
