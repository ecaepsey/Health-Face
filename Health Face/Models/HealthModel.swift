//
//  HealthModel.swift
//  Health Face
//
//  Created by Damir Aushenov on 21/11/25.
//

import Foundation

public struct HealthEntry: Identifiable, Codable, Equatable  {
    public let id: UUID
    public let date: Date
    public let puffiness: Int
    public let sleepQuality: Int
    public  let skinCondition: String
    public let notes: String?
    public let imagePath: String?
    
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

