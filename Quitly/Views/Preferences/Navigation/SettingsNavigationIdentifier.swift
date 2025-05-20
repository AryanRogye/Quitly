//
//  SettingsNavigationIdentifier.swift
//  Quitly
//
//  Created by Aryan Rogye on 5/20/25.
//

import SwiftUI

enum SettingsNavigationIdentifier: String, CaseIterable, Hashable, Identifiable, RawRepresentable {
    case general = "General"
    case advanced = "Advanced"
    case updates = "Updates"
    case about = "About"

    var id: String { rawValue }
    var localized: LocalizedStringKey {
        switch self {
        case .general:
            return "General"
        case .advanced:
            return "Advanced"
        case .updates:
            return "Updates"
        case .about:
            return "About"
        }
    }
}
