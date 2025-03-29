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

            TextField("키워드, 저널, 학회, 저자 등으로 검색", text: $text)
                .textFieldStyle(.plain)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(Color(NSColor.controlBackgroundColor))
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.2))
        )
        .frame(height: 32)
    }
}

#Preview("SearchInputField") {
    @State var query: String = ""
    return SearchInputField(text: $query)
        .padding()
        .previewLayout(.sizeThatFits)
}
