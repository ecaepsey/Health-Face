//
//  HealthModel.swift
//  Health Face
//
//  Created by Damir Aushenov on 21/11/25.
//

import Foundation

struct HealthEntry: Identifiable, Codable, Equatable  {
    let id: UUID
    let date: Date
    let puffiness: Int
    let sleepQuality: Int
    let skinCondition: String
    let notes: String?
    let imagePath: String?
    
    init(id: UUID = UUID(), date: Date, puffiness: Int, sleepQuality: Int, skinCondition: String, notes: String?, imagePath: String? = nil) {
        self.id = id
        self.date = date
        self.puffiness = puffiness
        self.sleepQuality = sleepQuality
        self.skinCondition = skinCondition
        self.notes = notes
        self.imagePath = imagePath
    }
}

struct ReminderSettings: Codable {
    var isEnabled: Bool
    var time: Date
}
