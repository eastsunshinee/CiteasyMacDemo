//
//  SearchInputField.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/30/25.
//

import SwiftUI

struct SearchInputField: View {
    @Binding var text: String

    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)

            TextField("검색어를 입력하세요", text: $text)
                .textFieldStyle(.plain)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.2))
        )
        .frame(height: 32)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    struct PreviewWrapper: View {
        @State var query = ""

        var body: some View {
            SearchInputField(text: $query)
                .padding()
        }
    }

    return PreviewWrapper()
}
