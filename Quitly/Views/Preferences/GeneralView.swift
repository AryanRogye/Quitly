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
                HStack {
                    Spacer()
                    Toggle(isOn: $appsManager.showAdvancedApplications) {
                        Text("Show Advanced Applications")
                    }
                    .toggleStyle(.switch)
                }
                ForEach(Array(appsManager.userApps), id: \.self) { app in
                    UserAppInfoRow(app: app)
                }
                Spacer()
            }
            .padding(.horizontal, 8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    GeneralView()
}
