//
//  PreviewPanelView.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import SwiftUI

struct PreviewPanelView: View {
    var previewText: String
    var onEdit: () -> Void
    var onCite: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("미리보기")
                .font(.headline)
                .foregroundColor(.secondary)

            Text(previewText)
                .font(.title3)
                .bold()

            HStack {
                Button("수정하기", action: onEdit)
                    .buttonStyle(.bordered)

                Spacer()

                Button(action: onCite) {
                    Label("인용하기", systemImage: "quote.bubble")
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .background(Color(NSColor.controlBackgroundColor))
        .cornerRadius(12)
    }
}

#Preview("인용 미리보기") {
    PreviewPanelView(
        previewText: "(김철수, 2023)",
        onEdit: { print("Edit tapped") },
        onCite: { print("Cite tapped") }
    )
    .frame(width: 360)
    .padding()
}

