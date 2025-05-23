//
//  AppStateManager.swift
//  Quitly
//
//  Created by Aryan Rogye on 5/21/25.
//
import SwiftUI

@MainActor
final class AppStateManager: ObservableObject {
    
    static let shared = AppStateManager()
    
    public func setup() {
        UserAppsManager.shared.startMonitoringUserApps()
        WindowVisibilityManager.shared.start()
    }
}
