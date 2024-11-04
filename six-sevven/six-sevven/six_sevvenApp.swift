import SwiftUI

@main
struct CustomOnscreenKeyboardApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(HiddenTitleBarWindowStyle()) // Hide the title bar
        .commands { // Remove default menu commands
            CommandGroup(replacing: .newItem, addition: { })
        }
    }

    init() {
        // Set window properties when the app launches
        for window in NSApplication.shared.windows {
            window.level = .floating // Keep window always on top
            window.isOpaque = false
            window.backgroundColor = .clear
            window.titleVisibility = .hidden
            window.titlebarAppearsTransparent = true
            window.standardWindowButton(.closeButton)?.isHidden = true
            window.standardWindowButton(.miniaturizeButton)?.isHidden = true
            window.standardWindowButton(.zoomButton)?.isHidden = true
            window.isMovableByWindowBackground = true
            window.ignoresMouseEvents = true
        }
    }
}

