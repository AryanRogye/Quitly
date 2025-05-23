//
//  AppDelegate.swift
//  Quitly
//
//  Created by Aryan Rogye on 5/20/25.
//

import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    
    private var appState: AppStateManager?

    func applicationWillFinishLaunching(_ notification: Notification) {
//        guard let appState else {
//            print("AppDelegate not initialized with AppStateManager.")
//            return
//        }
    }
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        guard let appState else {
            print("AppDelegate not initialized with AppStateManager.")
            return
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            // TODO: Manage Permissions Here Maybe
            appState.setup()
        }
    }
    
    func assignAppState(_ appState: AppStateManager) {
        guard self.appState == nil else {
            print("AppStateManager already assigned.")
            return
        }
        self.appState = appState
    }
    
    func applicationWillTerminate(_ notification: Notification) {
        // Clean up before the app terminates
    }
}
