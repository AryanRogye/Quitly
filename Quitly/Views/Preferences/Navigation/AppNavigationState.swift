//
//  AppNavigationState.swift
//  Quitly
//
import Combine

/// The model for app-wide navigation.
@MainActor
final class AppNavigationState: ObservableObject {
    static let shared = AppNavigationState()
    @Published var settingsNavigationIdentifier: SettingsNavigationIdentifier = .general
}
