//
//  ReferenceListView.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import SwiftUI

struct ReferenceListView: View {
    let items: [ReferenceItem]
    var onCite: (ReferenceItem) -> Void

    var body: some View {
        List {
            ForEach(items) { item in
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.title)
                        .font(.headline)
                    Text("\(item.author) • \(item.year)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .contextMenu {
                    Button("인용하기") {
                        onCite(item)
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    ReferenceListView(
        items: [
            ReferenceItem(title: "Swift의 이해", author: "홍길동", year: "2023", isSelected: false),
            ReferenceItem(title: "iOS 프로그래밍", author: "김개발", year: "2024", isSelected: false)
        ],
        onCite: { _ in }
    )
}
