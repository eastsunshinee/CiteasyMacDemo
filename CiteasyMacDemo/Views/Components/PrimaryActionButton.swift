//
//  PrimaryActionButton.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/30/25.
//

import SwiftUI

struct PrimaryActionButton: View {
    let title: String
    let systemImage: String?
    let isEnabled: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                if let systemImage {
                    Image(systemName: systemImage)
                }
                Text(title)
            }
            .font(.subheadline)
            .foregroundColor(.white.opacity(isEnabled ? 1 : 0.5))
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.accentColor.opacity(isEnabled ? 1 : 0.5))
            )
        }
        .disabled(!isEnabled)
        .buttonStyle(.plain)
    }
}

#Preview("PrimaryActionButton") {
    VStack(spacing: 12) {
        PrimaryActionButton(title: "참고문헌 생성", systemImage: "doc.text.magnifyingglass", isEnabled: true) {}
        PrimaryActionButton(title: "참고문헌 생성", systemImage: "doc.text.magnifyingglass", isEnabled: false) {}
    }
    .padding()
    .background(Color.black)
}

