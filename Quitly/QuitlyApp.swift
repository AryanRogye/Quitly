//
//  QuitlyApp.swift
//  Quitly
//
//  Created by Aryan Rogye on 5/20/25.
//

import SwiftUI

@main
struct QuitlyApp: App {
    
    @NSApplicationDelegateAdaptor var appDelegate: AppDelegate
    @StateObject private var appState = AppStateManager.shared
    
    init() {
        appDelegate.assignAppState(appState)
    }
    
    var body: some Scene {
        QuitlyStatusBar()
        
        
        Window("PreferencesView", id: "PreferencesView") {
            PreferencesView()
                .environmentObject(appState)
        }
        .defaultLaunchBehavior(.suppressed)
    }
}
