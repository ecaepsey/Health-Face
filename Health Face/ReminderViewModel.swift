//
//  ReminderViewModel.swift
//  Health Face
//
//  Created by Damir Aushenov on 3/12/25.
//

import Foundation


import Foundation

final class ReminderViewModel: ObservableObject {
    @Published var isEnabled: Bool = false
    @Published var time: Date = defaultTime
    
    private let storageKey = "faceReminderSettings"
    
    private static var defaultTime: Date {
        var comps = DateComponents()
        comps.hour = 20   // например, 20:00
        comps.minute = 0
        return Calendar.current.date(from: comps) ?? Date()
    }
    
    init() {
        load()
    }
    
    func load() {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
              let settings = try? JSONDecoder().decode(ReminderSettings.self, from: data) else {
            return
        }
        
        self.isEnabled = settings.isEnabled
        self.time = settings.time
    }
    
    func save() {
        let settings = ReminderSettings(isEnabled: isEnabled, time: time)
        
        if let data = try? JSONEncoder().encode(settings) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
        
        if isEnabled {
            ReminderManager.shared.requestAuthorizationIfNeeded { granted in
                DispatchQueue.main.async {
                    if granted {
                        ReminderManager.shared.scheduleDailyReminder(at: self.time)
                    } else {
                        // Доступ не дали — выключаем тумблер обратно
                        self.isEnabled = false
                    }
                }
            }
        } else {
            ReminderManager.shared.cancelDailyReminder()
        }
    }
}
