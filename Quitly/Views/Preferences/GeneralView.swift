//
//  GeneralView.swift
//  Quitly
//
//  Created by Aryan Rogye on 5/20/25.
//

import SwiftUI

struct GeneralView: View {
    @StateObject private var appsManager : UserAppsManager = .shared
    var body: some View {
        VStack {
            ScrollView {
                ForEach(Array(appsManager.userApps), id: \.self) { app in
                    UserAppInfoRow(app: app)
                }
                Spacer()
            }
        }
        .frame(width: 400, height: 300)
    }
}
