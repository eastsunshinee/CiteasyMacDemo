//
//  ToolbarChip.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/30/25.
//

import SwiftUI

struct ToolbarChip: View {
    let label: String
    var isActive: Bool = true
    var action: (() -> Void)? = nil

    var body: some View {
        Group {
            if let action {
                Button(action: action) {
                    chipContent
                }
                .buttonStyle(.plain)
            } else {
                chipContent
            }
        }
    }

    private var chipContent: some View {
        Text(label)
            .font(.footnote)
            .foregroundColor(isActive ? .blue : .secondary)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(
                RoundedRectangle(cornerRadius: 6)
                    .fill(isActive ? Color.blue.opacity(0.1) : Color.gray.opacity(0.1))
            )
    }
}

#Preview("ToolbarChip States") {
    VStack(spacing: 8) {
        ToolbarChip(label: "APA 7th")
        ToolbarChip(label: "MLA 9th", isActive: false)
        ToolbarChip(label: "IEEE", isActive: true, action: { print("Tapped") })
    }
    .padding()
    .previewLayout(.sizeThatFits)
}
