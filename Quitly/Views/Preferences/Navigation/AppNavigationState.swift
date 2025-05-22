//
//  AppNavigationState.swift
//  Quitly
//
import Combine

/// The model for app-wide navigation.
@MainActor
final class AppNavigationState: ObservableObject {
    @Published var settingsNavigationIdentifier: SettingsNavigationIdentifier = .general
}
