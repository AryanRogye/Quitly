//
//  SettingsManager.swift
//  Quitly
//
//  Created by Aryan Rogye on 5/21/25.
//

import SwiftUI

@MainActor
final class SettingsManager: ObservableObject {
    let generalSettingsManager: GeneralSettingsManager = .shared
}
