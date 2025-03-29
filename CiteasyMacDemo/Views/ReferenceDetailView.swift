//
//  ReferenceDetailView.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import SwiftUI

struct ReferenceDetailView: View {
    let item: ReferenceItem?

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if let item = item {
                Text(item.title)
                    .font(.title2)
                    .bold()

                Text("저자: \(item.author)")
                    .font(.body)

                Text("출판 연도: \(item.year)")
                    .font(.body)

                Divider()

                VStack(alignment: .leading, spacing: 4) {
                    Text("인용 양식")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("[\(item.author)(\(item.year))]")
                        .font(.callout)
                        .foregroundColor(.primary)
                        .padding(6)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(6)
                }

                Spacer()
            } else {
                Text("선택된 참고문헌이 없습니다.")
                    .foregroundColor(.secondary)
                    .italic()
                Spacer()
            }
        }
        .padding()
        .frame(minWidth: 280, idealWidth: 300, maxWidth: 350)
        .background(Color(NSColor.controlBackgroundColor))
        .cornerRadius(8)
    }
}

#Preview {
    ReferenceDetailView(
        item: ReferenceItem(title: "SwiftUI 앱 개발", author: "홍길동", year: "2024")
    )
    .frame(height: 300)
}
