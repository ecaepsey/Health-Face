//
//  CompareViewModel.swift
//  Health Face
//
//  Created by Damir Aushenov on 25/11/25.
//

import SwiftUI

class CompareViewModel: ObservableObject {
    @Published var allEntries: [HealthEntry] = []
    @Published var firstEntry: HealthEntry?
    @Published var secondEntry: HealthEntry?
    
    init(entries: [HealthEntry]) {
        self.allEntries = entries.sorted { $0.date < $1.date }
    }
    
    func selectFirst(_ entry: HealthEntry) {
        firstEntry = entry
    }
    
    func selectSecond(_ entry: HealthEntry) {
        secondEntry = entry
    }
}
