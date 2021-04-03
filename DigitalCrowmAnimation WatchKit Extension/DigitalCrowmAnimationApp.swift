//
//  DigitalCrowmAnimationApp.swift
//  DigitalCrowmAnimation WatchKit Extension
//
//  Created by Alexander Römer on 03.04.21.
//

import SwiftUI

@main
struct DigitalCrowmAnimationApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
