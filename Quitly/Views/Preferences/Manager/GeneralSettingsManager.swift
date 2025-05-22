//
//  GeneralSettingsManager.swift
//  Quitly
//
//  Created by Aryan Rogye on 5/21/25.
//

import SwiftUI

@MainActor
final class GeneralSettingsManager: ObservableObject {
    /// A boolean value that indicates whether to show
    /// from users /Applications folder or scan all
    /// running Applications <- This includes system apps
    ///     Useful for apps such as Finder, Messages, etc.
    @Published var showAdvancedApplications: Bool = false
}

struct GeneralSettingsBindings {
    var showAdvancedApps: Binding<Bool>
}
extension GeneralSettingsManager {
    var bindings: GeneralSettingsBindings {
        GeneralSettingsBindings(
            showAdvancedApps: Binding(
                get: { self.showAdvancedApplications },
                set: { self.showAdvancedApplications = $0 }
            )
        )
    }
}
