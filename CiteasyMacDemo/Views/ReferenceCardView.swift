//
//  ReferenceCardView.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import SwiftUI

struct ReferenceCardView: View {
    let item: ReferenceItem
    let onCite: (ReferenceItem) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(item.title)
                .font(.headline)
            Text("\(item.author) • \(item.year)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Button("인용하기") {
                onCite(item)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(Color(NSColor.windowBackgroundColor))
        .cornerRadius(8)
        .shadow(radius: 1)
    }
}

#Preview {
    ReferenceCardView(
        item: ReferenceItem(
            title: "SwiftUI 앱 개발",
            author: "홍길동",
            year: "2024"
        ),
        onCite: { _ in print("인용하기 눌림") }
    )
    .padding()
    .frame(width: 300)
}
