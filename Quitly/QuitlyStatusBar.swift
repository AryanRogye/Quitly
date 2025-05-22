//
//  QuitlyStatusBar.swift
//  Quitly
//
//  Created by Aryan Rogye on 5/20/25.
//

import SwiftUI

struct QuitlyStatusBar: Scene {
    @Environment(\.openWindow) var openWindow
    @EnvironmentObject var appState: AppStateManager
        
    var body: some Scene {
        MenuBarExtra("Quitly", image: "QuitLogo_white") {
            Button(action: {
                openWindow(id: "PreferencesView")
            }) {
                Text("Preferences")
            }
            .keyboardShortcut(",", modifiers: [.command])
            Divider()
            Button("Quit") {
                NSApp.terminate(nil)
            }
        }
        .menuBarExtraStyle(.menu)
    }
}
