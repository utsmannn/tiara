//
// Created by Ruangguru on 13/12/21.
//

import Foundation
import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {

    var popover: NSPopover!
    var statusBarItem: NSStatusItem!

    func applicationDidFinishLaunching(_ notification: Notification) {
        let contentView = EditorView()

        let popover = NSPopover()
        popover.contentSize = NSSize(width: 400, height: 360)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: contentView)
        self.popover = popover

        statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))

        if let button = statusBarItem.button {
            button.title = "tiara"
            button.action = #selector(togglePopover(_:))
        }

        NSApplication.shared.mainWindow?.close()
    }

    @objc func togglePopover(_ sender: AnyObject?) {
        if let button = statusBarItem.button {
            if popover.isShown {
                popover.performClose(sender)
            } else {
                popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            }
        }
    }
}