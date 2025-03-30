//
//  CapsuleButton.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/30/25.
//

import SwiftUI

struct CapsuleButton: View {
    let label: String
    let isSelected: Bool

    var body: some View {
        Text(label)
            .font(.caption)
            .foregroundColor(isSelected ? .white : .primary)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(isSelected ? Color.accentColor : Color.gray.opacity(0.2))
            .clipShape(Capsule())
    }
}

#Preview("CapsuleButton States") {
    HStack(spacing: 16) {
        CapsuleButton(label: "국문", isSelected: true)
        CapsuleButton(label: "영문", isSelected: false)
    }
    .padding()
}
