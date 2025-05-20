//
//  AppDelegate.swift
//  Quitly
//
//  Created by Aryan Rogye on 5/20/25.
//

import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        UserAppsManager.shared.startMonitoringUserApps()
        WindowVisibilityManager.shared.start()
    }
    
    func applicationWillTerminate(_ notification: Notification) {
        // Clean up before the app terminates
    }
}
