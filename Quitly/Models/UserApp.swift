//
//  UserApp.swift
//  Quitly
//
//  Created by Aryan Rogye on 5/20/25.
//
import AppKit

struct UserApp: Identifiable, Hashable {
    let app: NSRunningApplication
    var autoQuitEnabled: Bool
    
    var id: String {
        app.bundleIdentifier ?? "\(app.processIdentifier)"
    }
    
    var name: String {
        app.localizedName ?? "Unknown App"
    }
    
    var icon: NSImage? {
        app.icon
    }
}
