//
//  AppNavigationState.swift
//  Quitly
//
import Combine
import SwiftUI

/// The model for app-wide navigation.
@MainActor
final class AppNavigationState: ObservableObject {
    
    static let shared = AppNavigationState()
    
    @Published var settingsNavigationIdentifier: SettingsNavigationIdentifier = .general
}
