//
//  PreferencesView.swift
//  Quitly
//
//  Created by Aryan Rogye on 5/20/25.
//

import SwiftUI

struct PreferencesView: View {
    @StateObject private var appsManager : UserAppsManager = .shared
    var body: some View {
        ScrollView {
            ForEach(Array(appsManager.userApps), id: \.self) { app in
                UserAppInfoRow(app: app)
                Spacer()
            }
        }
        .frame(maxWidth: 400, maxHeight: 500)
    }
}


#Preview {
    PreferencesView()
}
