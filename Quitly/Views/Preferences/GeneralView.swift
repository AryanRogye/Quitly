//
//  GeneralView.swift
//  Quitly
//
//  Created by Aryan Rogye on 5/20/25.
//

import SwiftUI

struct GeneralView: View {
    
    @EnvironmentObject var appState: AppStateManager
    
    private var generalSettingsManager: GeneralSettingsManager {
        appState.settingsManager.generalSettingsManager
    }

    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    Spacer()
                    Toggle(isOn: generalSettingsManager.bindings.showAdvancedApps) {
                        Text("Show Advanced Applications")
                    }
                    .toggleStyle(.switch)
                }
                ForEach(Array(appState.appsManager.userApps), id: \.self) { app in
                    UserAppInfoRow(app: app)
                }
                Spacer()
            }
            .padding(.horizontal, 8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
