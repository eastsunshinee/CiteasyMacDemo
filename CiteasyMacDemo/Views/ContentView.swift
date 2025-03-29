//
//  ContentView.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/28/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("인용하기") {
                copyCitation()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    pasteCitationViaMenu()
                }
            }
        }
        .padding()
    }

    func copyCitation() {
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.declareTypes([.string], owner: nil)
        pasteboard.setString("[홍길동(2024)]", forType: .string)
    }

    func pasteCitationViaMenu() {
        let appleScript = """
            tell application "Pages"
activate
end tell
delay 0.5
tell application "System Events"
    tell process "Pages"
        click menu item "붙여넣기" of menu "편집" of menu bar 1
    end tell
end tell
"""
        if let script = NSAppleScript(source: appleScript) {
            var error: NSDictionary?
            script.executeAndReturnError(&error)
            if let error = error {
                print("AppleScript Error: \(error)") // 이 줄이 없으면 경고
            }
        }
    }
}

#Preview {
    ContentView()
}
