//
//  ReferenceViewModel.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import Foundation

class ReferenceViewModel: ObservableObject {
    @Published var references: [ReferenceItem] = [
        ReferenceItem(title: "SwiftUI 앱 개발", author: "홍길동", year: "2024"),
        ReferenceItem(title: "iOS 비동기 처리", author: "김철수", year: "2023")
    ]

    func handleCitation(for item: ReferenceItem) {
        ClipboardService.copy(text: item.citationText)
        AppleScriptService.pasteIntoPages()
    }
}
