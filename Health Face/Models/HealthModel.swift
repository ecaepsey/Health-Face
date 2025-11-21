//
//  HealthModel.swift
//  Health Face
//
//  Created by Damir Aushenov on 21/11/25.
//

import Foundation

struct HealthEntry: Codable, Identifiable {
    let id: UUID
    let date: Date
    let puffiness: Int
    let sleepQuality: Int
    let skinCondition: String
    let notes: String?
    let imagePath: String?
}
