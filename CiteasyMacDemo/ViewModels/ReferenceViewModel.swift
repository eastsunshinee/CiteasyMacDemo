//
//  ReferenceViewModel.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import Foundation
import SwiftUI

class ReferenceViewModel: ObservableObject {
    // 전체 참고문헌 리스트
    @Published var references: [ReferenceItem] = [
        .init(title: "SwiftUI 앱 개발", author: "홍길동", year: "2024"),
        .init(title: "iOS 비동기 처리", author: "김철수", year: "2023"),
        .init(title: "Combine과 MVVM", author: "박지민", year: "2022")
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

    func handleCitation(for item: ReferenceItem) {
        print("인용 처리: \(item.title)")
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
