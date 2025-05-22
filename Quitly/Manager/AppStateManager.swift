//
//  AppStateManager.swift
//  Quitly
//
//  Created by Aryan Rogye on 5/21/25.
//
import SwiftUI

@MainActor
final class AppStateManager: ObservableObject {
    
    var settingsManager = SettingsManager()
    
    var navigationState = AppNavigationState()
    
    
    var visibilityManager = WindowVisibilityManager()
    
    lazy var quitlyItem = QuitlyItem(appState: self)
    
    lazy var appsManager = UserAppsManager(appState: self)

    public func setup() {
        _ = quitlyItem
        appsManager.startMonitoringUserApps()
        visibilityManager.start()
    }
}
