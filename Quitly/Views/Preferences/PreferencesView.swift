//
//  PreferencesView.swift
//  Quitly
//
//  Created by Aryan Rogye on 5/20/25.
//

import SwiftUI
import AppKit

struct PreferencesView: View {
    
    @EnvironmentObject var appState: AppStateManager
    @Environment(\.sidebarRowSize) var sidebarRowSize
    
    private var sidebarWidth: CGFloat {
        switch sidebarRowSize {
        case .small: 150
        case .medium: 170
        case .large: 190
        @unknown default: 170
        }
    }
    
    var body: some View {
        NavigationSplitView {
            sidebar
        } detail: {
            detailView
        }
        .navigationTitle(appState.navigationState.settingsNavigationIdentifier.localized)
    }
    
    // MARK: - Internal Views
    
    @ViewBuilder
    private var sidebar: some View {
        List(selection: $appState.navigationState.settingsNavigationIdentifier) {
            Section {
                ForEach(SettingsNavigationIdentifier.allCases, id: \.self) { identifier in
                    sidebarItem(for: identifier)
                }
            } header: {
                Text("Quitly")
                    .font(.system(size: 36, weight: .medium))
                    .foregroundStyle(.primary)
                    .padding(.vertical, 5)
            }
            .collapsible(false)
        }
        .scrollDisabled(true)
        .navigationSplitViewColumnWidth(sidebarWidth)
        
    }
    
    @ViewBuilder
    private var detailView: some View {
        switch appState.navigationState.settingsNavigationIdentifier {
        case .general   : GeneralView()
        case .advanced  : AdvancedView()
        case .updates   : UpdatesView()
        case .about     : AboutView()
        }
    }
    
    // MARK: - Internal Functions
    
    @ViewBuilder
    private func sidebarItem(for identifier: SettingsNavigationIdentifier) -> some View {
        HStack(spacing: 10) {
            Image(nsImage: icon(for: identifier))
                .resizable()
                .frame(width: 18, height: 17)
                .foregroundColor(appState.navigationState.settingsNavigationIdentifier == identifier
                                 ? .white : .accentColor)
            
            Text(identifier.localized)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.primary)
        }
        .padding(.vertical, 2)
        .frame(height: 25)
    }
    
    private func icon(for identifier: SettingsNavigationIdentifier) -> NSImage {
        switch identifier {
        case .general: return NSImage(systemSymbolName: "gearshape", accessibilityDescription: nil) ?? NSImage()
        case .advanced: return NSImage(systemSymbolName: "gearshape.2", accessibilityDescription: nil) ?? NSImage()
        case .updates: return NSImage(systemSymbolName: "arrow.triangle.2.circlepath", accessibilityDescription: nil) ?? NSImage()
        case .about: return NSImage(systemSymbolName: "cube.fill", accessibilityDescription: nil) ?? NSImage()
        }
    }
}

#Preview {
    PreferencesView()
}
