//
//  UserAppsManager.swift
//  Quitly
//
//  Created by Aryan Rogye on 5/20/25.
//

import SwiftUI

final class UserAppsManager: ObservableObject {
    static let shared = UserAppsManager()
    
    @Published var userApps: [UserApp] = []
    @Published var showAdvancedApplications: Bool = false

    public func startMonitoringUserApps() {
        /// We Poll Every 5 Seconds
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] _ in
            self?.updateUserAppsOpen()
            self?.userApps.forEach({ app in
                self?.quitAppIfNeeded(app)
            })
        }
    }
    
    private func updateUserAppsOpen() {
        var updated: [UserApp] = []
        
        for app in NSWorkspace.shared.runningApplications {
            if showAdvancedApplications {
                /// Show All Running Applications
                let existing = userApps.first(where: { $0.id == (app.bundleIdentifier ?? "\(app.processIdentifier)") })
                updated.append(UserApp(app: app, autoQuitEnabled: existing?.autoQuitEnabled ?? false))
            } else {
                /// Show Only Applications in /Applications
                if let bundleURL = app.bundleURL, bundleURL.path.hasPrefix("/Applications") {
                    let existing = userApps.first(where: { $0.id == (app.bundleIdentifier ?? "\(app.processIdentifier)") })
                    updated.append(UserApp(app: app, autoQuitEnabled: existing?.autoQuitEnabled ?? false))
                }
            }
        }
        
        DispatchQueue.main.async {
            self.userApps = updated
        }
    }
    
    private func quitAppIfNeeded(_ app: UserApp) {
        if app.autoQuitEnabled {
            print("Checking if \(app.name) has visible windows")
            if !WindowVisibilityManager.shared.doesAppHasVisibleWindows(for: app.app) {
                print("Quitting \(app.name)")
                // Try graceful; fallback to force
                if !app.app.terminate() {
                    _ = app.app.forceTerminate()
                }
            }
        }
    }
}
