//
//  PushNotificationService.swift
//  FoodApp
//
//  Created by Amby on 06/08/2022.
//

import Foundation
import SwiftUI
import UserNotifications

final class PushNotificationService: NSObject {
    static var shared: PushNotificationService = PushNotificationService()

    private(set) lazy var center: UNUserNotificationCenter = {
        let center = UNUserNotificationCenter.current()
        center.delegate = delegate

        return center
    }()

    let delegate = NotificationDelegate()

    func registerRemotePushNotifications() {
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]

        center.requestAuthorization(options: authOptions, completionHandler: {_, _ in })
        UIApplication.shared.registerForRemoteNotifications()
    }

    func scheduleOrderLocationNotification(type: NotificationType) {
        let date = Date().addingTimeInterval(5)
        let dateComponent = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)

        let metadata = type.metadata
        let content = UNMutableNotificationContent()
        content.title = metadata.title
        content.body = metadata.body

        let request = UNNotificationRequest(identifier: metadata.identifier, content: content, trigger: trigger)
        center.add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
    }
}

final class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.banner)
    }
}
