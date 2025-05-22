//
//  QuitlyItem.swift
//  Quitly
//
//  Created by Aryan Rogye on 5/22/25.
//

import Cocoa
import SwiftUI

@MainActor
final class QuitlyItem {
    
    private weak var appState: AppStateManager?
    private let statusItem: NSStatusItem
    @Environment(\.openWindow) var openWindow

    init(appState: AppStateManager) {
        print("Called")
        self.statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        self.statusItem.autosaveName = "Quitly"
        self.appState = appState
        
        if let button = self.statusItem.button {
            button.image = NSImage(named: "QuitLogo_white")
            button.action = #selector(showMenu(_:))
            button.target = self
        }
        statusItem.menu = buildMenu()
    }
    
    private func buildMenu() -> NSMenu {
        let menu = NSMenu()

        let preferences = NSMenuItem(
            title: "Preferences",
            action: #selector(openPreferences),
            keyEquivalent: ","
        )
        preferences.keyEquivalentModifierMask = .command
        preferences.target = self
        menu.addItem(preferences)

        menu.addItem(.separator())

        let quit = NSMenuItem(
            title: "Quit",
            action: #selector(NSApp.terminate),
            keyEquivalent: "q"
        )
        quit.keyEquivalentModifierMask = .command
        menu.addItem(quit)

        return menu
    }
    
    @objc private func openPreferences() {
        self.openWindow(id: "PreferencesView")
    }

    @objc private func showMenu(_ sender: Any?) {
        // If you want to manually show menu on click, call:
        statusItem.menu = buildMenu()
    }
    
    deinit {
        
    }
}
