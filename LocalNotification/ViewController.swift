//
//  ViewController.swift
//  LocalNotification
//
//  Created by Abhay Kmar on 05/07/22.
//

import UIKit
import UserNotifications
class ViewController: UIViewController, UNUserNotificationCenterDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       //      step - 1 Request Authorization
       
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options:[.alert, .badge, .sound]) { (granted, error) in
            if error == nil {
                print("User permission Granted \(granted)")
            }
        }

//      step 2 Create the notification content
        
        let content = UNMutableNotificationContent()
        
        content.title = "Local notification"
        content.body  = "Hey! there you have a notification "
        
//        step-3 Create the notification Trigger
        
        let date = Date().addingTimeInterval(5)
        let dateComponents = Calendar.current.dateComponents([.year, .month,.day,.hour,.minute,.second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats:false)

//        step - 4 Create the request
        
        let uuid = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)

//        step - 5 Register the Request
        center.add(request) { (error) in
            
        }
    }
}
