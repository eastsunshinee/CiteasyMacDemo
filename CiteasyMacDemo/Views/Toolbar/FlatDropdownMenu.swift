//
//  FlatDropdownMenu.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/30/25.
//

import SwiftUI

struct FlatDropdownMenu<LabelView: View>: View {
    let options: [String]
    @Binding var selected: String
    let label: () -> LabelView

    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(option) {
                    selected = option
                }
            }
        } label: {
            HStack(spacing: 4) {
                label()
                Image(systemName: "chevron.down")
                    .font(.system(size: 10, weight: .semibold))
            }
            .font(.footnote)
            .foregroundColor(.primary)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.gray.opacity(0.3))
            )
        }
        .menuStyle(.borderlessButton)
    }
}

#Preview("FlatDropdownMenu", traits: .sizeThatFitsLayout) {
    struct PreviewWrapper: View {
        @State var current = "최신 북마크순"

        var body: some View {
            FlatDropdownMenu(
                options: ["기본", "최신 북마크순", "가나다순"],
                selected: $current
            ) {
                Text(current)
            }
            .padding()
        }
    }

    return PreviewWrapper()
}
