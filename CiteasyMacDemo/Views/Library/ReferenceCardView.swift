//
//  ReferenceCardView.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import SwiftUI

import SwiftUI

struct ReferenceCardView: View {
    let item: ReferenceItem
    let isSelected: Bool
    let onToggle: () -> Void

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            // 체크박스
            Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                .foregroundColor(isSelected ? .accentColor : .secondary)
                .onTapGesture { onToggle() }

            VStack(alignment: .leading, spacing: 2) {
                Text(item.title)
                    .font(.title3.bold()) // 🆙 강조 (기존보다 크게)
                    .foregroundColor(.primary)
                    .lineLimit(2)

                Text("\(item.author) • \(item.year)")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 4)
        .contentShape(Rectangle())
        .background(isSelected ? Color.accentColor.opacity(0.1) : Color.clear)
    }
}

#Preview {
    VStack(alignment: .leading) {
        ReferenceCardView(
            item: ReferenceItem(title: "SwiftUI 앱 개발", author: "홍길동", year: "2024"),
            isSelected: true,
            onToggle: {}
        )
        ReferenceCardView(
            item: ReferenceItem(title: "iOS 비동기 처리", author: "김철수", year: "2023"),
            isSelected: false,
            onToggle: {}
        )
    }
    .padding()
    .frame(width: 400)
}
