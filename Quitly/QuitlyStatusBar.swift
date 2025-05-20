//
//  QuitlyStatusBar.swift
//  Quitly
//
//  Created by Aryan Rogye on 5/20/25.
//

import SwiftUI

struct QuitlyStatusBar: Scene {
    var body: some Scene {
        MenuBarExtra("Quitly", systemImage: "xmark.circle") {
            Button(action: {
                if let url = URL(string: "quitly://preferences") {
                    NSWorkspace.shared.open(url)
                }
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
