//
//  ReferenceRowView.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import SwiftUI

struct ReferenceRowView: View {
    var title: String
    var author: String
    var isSelected: Bool

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                .foregroundColor(.accentColor)
                .font(.title3)
                .padding(.top, 2)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .lineLimit(2)

                Text(author)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        .background(Color.clear)
    }
}

#Preview {
    ReferenceRowView(
        title: "SwiftUI와 애플 생태계의 발전 방향",
        author: "홍길동 · 2024",
        isSelected: false
    )
    .frame(width: 480)
}
