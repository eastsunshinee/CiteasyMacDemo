//
//  FlatButton.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/30/25.
//

import SwiftUI

struct FlatButton: View {
    let label: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.caption)
                .foregroundColor(.primary)
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(Color.gray.opacity(0.15))
                .cornerRadius(6)
        }
        .buttonStyle(.plain)
    }
}

#Preview("FlatButton States") {
    VStack(spacing: 12) {
        FlatButton(label: "변경") {}
        FlatButton(label: "참고문헌 추가") {}
    }
    .padding()
}
