//
//  ReferenceListView.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import SwiftUI

struct ReferenceListView: View {
    let items: [ReferenceItem]
    let selectedItems: Set<UUID>
    var onToggle: (ReferenceItem) -> Void
    var onCite: (ReferenceItem) -> Void

    var body: some View {
        List {
            ForEach(items) { item in
                ReferenceCardView(
                    item: item,
                    isSelected: selectedItems.contains(item.id),
                    onToggle: {
                        onToggle(item)
                    }
                )
                .contextMenu {
                    Button("인용하기") {
                        onCite(item)
                    }
                }
            }
        }
        .listStyle(.plain)
        .padding(.horizontal, 2)
    }
}

#Preview {
    ReferenceListView(
        items: [
            ReferenceItem(title: "SwiftUI 앱 개발", author: "홍길동", year: "2024"),
            ReferenceItem(title: "iOS 비동기 처리", author: "김철수", year: "2023")
        ],
        selectedItems: [],
        onToggle: { _ in },
        onCite: { _ in }
    )
    .frame(width: 440, height: 300)
}
