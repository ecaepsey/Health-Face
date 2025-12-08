//
//  ReminderManager.swift
//  Health Face
//
//  Created by Damir Aushenov on 3/12/25.
//

import Foundation

import Foundation
import UserNotifications

final class ReminderManager {
    static let shared = ReminderManager()
    private init() {}
    
    private let notificationId = "daily_face_reminder"
    
    // Проверяем/запрашиваем доступ
    func requestAuthorizationIfNeeded(completion: @escaping (Bool) -> Void) {
        let center = UNUserNotificationCenter.current()
        
        center.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .notDetermined:
                center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
                    completion(granted)
                }
            case .denied:
                completion(false)
            case .authorized, .provisional, .ephemeral:
                completion(true)
            @unknown default:
                completion(false)
            }
        }
    }
    
    func scheduleDailyReminder(at date: Date) {
        let center = UNUserNotificationCenter.current()
        
        // Удаляем старое напоминание
        center.removePendingNotificationRequests(withIdentifiers: [notificationId])
        
        let content = UNMutableNotificationContent()
        content.title = "Ежедневный чек лица"
        content.body = "Не забудь сделать фото и посмотреть прогресс ✨"
        content.sound = .default
        
        var dateComponents = Calendar.current.dateComponents([.hour, .minute], from: date)
        // Можно зафиксировать секунды
        dateComponents.second = 0
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: notificationId,
            content: content,
            trigger: trigger
        )
        
        center.add(request, withCompletionHandler: nil)
    }
    
    func cancelDailyReminder() {
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: [notificationId])
    }
}
