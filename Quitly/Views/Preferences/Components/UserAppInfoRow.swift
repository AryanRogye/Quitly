//
//  UserAppInfoRow.swift
//  Quitly
//
//  Created by Aryan Rogye on 5/20/25.
//
import SwiftUI

struct UserAppInfoRow: View {
    
    @StateObject private var appsManager = UserAppsManager.shared

    var app: UserApp
    
    init(app: UserApp) {
        self.app = app
    }
    
    var body: some View {
        HStack {
            Text(app.name)
            Spacer()
            if let image = app.icon {
                Image(nsImage: image)
                    .resizable()
                    .frame(width: 16, height: 16)
                    .cornerRadius(4)
            }
            Toggle(isOn: Binding(
                get: { app.autoQuitEnabled },
                set: { newVal in
                    appsManager.userApps = appsManager.userApps.map { userApp in
                        if userApp.id == app.id {
                            print("Toggled \(userApp.name) to \(newVal)")
                            var updatedApp = userApp
                            updatedApp.autoQuitEnabled = newVal
                            return updatedApp
                        }
                        return userApp
                    }
                })
            ) {
                Text("Quit")
            }
            .toggleStyle(.switch)
        }
        .onAppear {
//            print("Checking user apps...")
//            for apps in appState.appsManager.userApps {
//                print("\(apps.name)")
//            }
            print("UserAppsSize: \(appsManager.userApps.count)")
        }
    }
}
