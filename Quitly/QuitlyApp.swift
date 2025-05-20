//
//  QuitlyApp.swift
//  Quitly
//
//  Created by Aryan Rogye on 5/20/25.
//

import SwiftUI

@main
struct QuitlyApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        QuitlyStatusBar()
        
        WindowGroup("Preferences") {
            PreferencesView()
        }
        .handlesExternalEvents(matching: Set(arrayLiteral: "preferences"))
    }
}

