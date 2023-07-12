//
//  LocalNotificationBootcamp.swift
//  SwiftUI Advanced Learning
//
//  Created by Sai Jannali on 7/4/23.
//

import SwiftUI
import UserNotifications
import CoreLocation

final class NotificationManagr {
    static let instance = NotificationManagr()
    private init() {}
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("Error: \(error)")
            } else {
                print("Success")
            }
        }
    }
    
    func scheduleNotification() {
        let content =  UNMutableNotificationContent()
        content.title = "First notification"
        content.subtitle = "This is easy"
        content.sound = .default
        content.badge = 1
        
        //time
        //let trigger  = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        // calender (everyday @ 8:26pm)
//        var dateComponents = DateComponents()
//        dateComponents.hour = 20
//        dateComponents.minute = 26
//        dateComponents.weekday = 1 // sunday
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // location
        let coordinates = CLLocationCoordinate2D(
            latitude: 40.00,
            longitude: 50.00)
        let region = CLCircularRegion(
            center: coordinates,
            radius: 100,
            identifier: UUID().uuidString)
        region.notifyOnEntry = true
        region.notifyOnExit = false
        let trigger = UNLocationNotificationTrigger(region:  region, repeats: true)
        
        
        
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func closeNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct LocalNotificationBootcamp: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("request permission") {
                NotificationManagr.instance.requestAuthorization()
            }
            
            Button("schedule notification") {
                NotificationManagr.instance.scheduleNotification()
            }
        }
        .onAppear {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

struct LocalNotificationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotificationBootcamp()
    }
}
