//
//  SettingsManager.swift
//  Quitly
//
//  Created by Aryan Rogye on 5/21/25.
//

import SwiftUI

@MainActor
final class SettingsManager: ObservableObject {
    @Published var generalSettingsManager = GeneralSettingsManager()
}
