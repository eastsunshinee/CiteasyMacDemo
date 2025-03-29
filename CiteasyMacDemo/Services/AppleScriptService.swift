//
//  AppleScriptService.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import Foundation

struct AppleScriptService {
    static func pasteIntoPages() {
        let script = """
        tell application "Pages"
            activate
        end tell
        delay 0.3
        tell application "System Events"
            tell process "Pages"
                click menu item "붙여넣기" of menu "편집" of menu bar 1
            end tell
        end tell
        """

        var error: NSDictionary?
        if let appleScript = NSAppleScript(source: script) {
            appleScript.executeAndReturnError(&error)
            if let error = error {
                print("AppleScript Error: \(error)")
            }
        }
    }
}
