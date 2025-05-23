//
//  GeneralView.swift
//  Quitly
//
//  Created by Aryan Rogye on 5/20/25.
//

import SwiftUI

struct GeneralView: View {
    
    @StateObject private var appsManager = UserAppsManager.shared
    @StateObject private var settingsManager = SettingsManager.shared
    
    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    Spacer()
                    Toggle(isOn: $settingsManager.generalSettingsManager.showAdvancedApplications) {
                        Text("Show Advanced Applications")
                    }
                    .toggleStyle(.switch)
                }
                ForEach(Array(appsManager.userApps), id: \.self) { app in
                    Text(app.name)
                }
                ForEach(Array(appsManager.userApps), id: \.self) { app in
                    UserAppInfoRow(app: app)
                }
                Spacer()
            }
            .padding(.horizontal, 8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
//            print("Checking user apps...")
//            for apps in appState.appsManager.userApps {
//                print("\(apps.name)")
//            }
            print("UserAppsSize: \(appsManager.userApps.count)")
        }
    }
}
