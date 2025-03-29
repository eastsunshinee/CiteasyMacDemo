//
//  CiteasyMacDemoApp.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/28/25.
//

import SwiftUI

@main
struct CiteasyMacDemoApp: App {
//    init() {
//        triggerSystemEventsAccess()
//    }

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

func triggerSystemEventsAccess() {
    let appleScript = """
    tell application "System Events"
        get name of every process
    end tell
    """
    var error: NSDictionary?
    if let script = NSAppleScript(source: appleScript) {
        script.executeAndReturnError(&error)
        if let error = error {
            print("AppleScript Error: \(error)")
        }
    }
}
