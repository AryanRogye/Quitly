//
//  WindowVisibilityManager.swift
//  Quitly
//
//  Created by Aryan Rogye on 5/20/25.
//
import ApplicationServices
import SwiftUI

final class WindowVisibilityManager: ObservableObject {
    @Published var permissionsGranted: Bool = false
    
    init() {}
    
    public func start() {
        self.permissionsGranted = self.accessibilityPermissionsGranted()
        
        /// Check for accessibility permissions every 5 seconds
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            let isTrusted = AXIsProcessTrusted()
            if self.permissionsGranted != isTrusted {
                DispatchQueue.main.async {
                    self.permissionsGranted = isTrusted
                }
            }
        }
    }
    
    func doesAppHasVisibleWindows(for app: NSRunningApplication) -> Bool {
        let appElement = AXUIElementCreateApplication(app.processIdentifier)

        var value: CFTypeRef?
        let result = AXUIElementCopyAttributeValue(appElement, kAXWindowsAttribute as CFString, &value)

        guard result == .success, let windows = value as? [AXUIElement] else {
            return false
        }
        
        if windows.count > 0 {
            print("App: \(app.localizedName ?? "Unknown") has \(windows.count) windows")
            return true
        }

        return false
    }

    private func accessibilityPermissionsGranted() -> Bool {
        let options = [kAXTrustedCheckOptionPrompt.takeRetainedValue(): true] as CFDictionary
        return AXIsProcessTrustedWithOptions(options)
    }
}
