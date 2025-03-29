//
//  ClipboardService.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import Foundation
import AppKit

struct ClipboardService {
    static func copy(text: String) {
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(text, forType: .string)
    }
}
