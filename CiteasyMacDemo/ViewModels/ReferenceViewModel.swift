//
//  ReferenceViewModel.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import Foundation
import SwiftUI
import AppKit

class ReferenceViewModel: ObservableObject {
    // 전체 참고문헌 리스트
    @Published var references: [ReferenceItem] = [
        .init(title: "Understanding SwiftUI: A Declarative Approach to UI Development",
              author: "John Sundell", year: "2023"),

            .init(title: "Modern Concurrency in iOS: Async/Await in Practice",
                  author: "Donny Wals", year: "2022"),

            .init(title: "Design Patterns in Swift: MVC, MVVM, and Beyond",
                  author: "Antoine van der Lee", year: "2024"),

            .init(title: "The Combine Framework Explained",
                  author: "Paul Hudson", year: "2021"),

            .init(title: "Building Accessible macOS Apps with SwiftUI",
                  author: "Majid Jabrayilov", year: "2023")
    ]

    // 선택된 ReferenceItem의 UUID
    @Published var selectedItems: Set<UUID> = []

    // 검색어 및 기타 UI 상태
    @Published var searchQuery: String = ""
    @Published var sorting: SortingOption = .defaultOption
    @Published var showCitationStyleView: Bool = false
    @Published var showAddReferenceSheet: Bool = false

    // 선택된 ReferenceItem 목록
    var selectedReferenceItems: [ReferenceItem] {
        references.filter { selectedItems.contains($0.id) }
    }

    // 액션
    func generateCitation() {
        print("참고문헌 생성 실행")
    }

    func toggleSelection(for item: ReferenceItem) {
        if selectedItems.contains(item.id) {
            selectedItems.remove(item.id)
        } else {
            selectedItems.insert(item.id)
        }
    }

    func isSelected(_ item: ReferenceItem) -> Bool {
        selectedItems.contains(item.id)
    }

    enum SortingOption {
        case defaultOption
        case recent
    }

    static var mock: ReferenceViewModel {
        let vm = ReferenceViewModel()
        vm.selectedItems = Set([vm.references.first?.id].compactMap { $0 })
        return vm
    }
}

extension ReferenceViewModel {
    func handleCitation(for item: ReferenceItem, targetApp: CitationTarget = .pages) {
        let citationText = "[\(item.author)(\(item.year))]"

        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(citationText, forType: .string)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            let appleScript: String

            switch targetApp {
            case .pages:
                appleScript = """
                tell application "Pages"
                    activate
                end tell
                delay 0.4
                tell application "System Events"
                    tell process "Pages"
                        click menu item "붙여넣기" of menu "편집" of menu bar 1
                    end tell
                end tell
                """

            case .word:
                appleScript = """
                tell application "Microsoft Word"
                    activate
                end tell
                delay 0.4
                tell application "System Events"
                    tell process "Microsoft Word"
                        click menu item "붙여넣기" of menu "편집" of menu bar 1
                    end tell
                end tell
                """
            }

            if let script = NSAppleScript(source: appleScript) {
                var error: NSDictionary?
                script.executeAndReturnError(&error)
                if let error = error {
                    print("AppleScript Error: \(error)")
                }
            }
        }
    }

    enum CitationTarget {
        case pages
        case word
    }

}
