//
//  ReferenceCardView.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import SwiftUI

struct ReferenceCardView: View {
    let item: ReferenceItem

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(item.title)
                .font(.headline)
                .foregroundStyle(.primary)
                .lineLimit(1)

            Text("\(item.author) · \(item.year)")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .lineLimit(1)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(item.isSelected ? Color.accentColor.opacity(0.15) : Color(NSColor.controlBackgroundColor))
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(item.isSelected ? Color.accentColor : Color.gray.opacity(0.3), lineWidth: item.isSelected ? 2 : 1)
        )
        .contentShape(Rectangle())
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    VStack(spacing: 12) {
        ReferenceCardView(item: .init(title: "SwiftUI에서 macOS 앱 만들기", author: "김동현", year: "2024", isSelected: true))
        ReferenceCardView(item: .init(title: "iOS 개발자를 위한 macOS 전환 가이드", author: "홍길동", year: "2023", isSelected: false))
    }
    .padding()
    .frame(width: 360)
    .background(Color(NSColor.windowBackgroundColor))
}
