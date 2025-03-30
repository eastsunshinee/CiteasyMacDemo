//
//  TopToolbarView.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import SwiftUI

struct TopToolbarView: View {
    @ObservedObject var viewModel: ReferenceViewModel
    @State private var selectedSorting: String = "최신 북마크순"

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("내 서재")
                    .font(.title3.bold()) // 하단 기준 맞춤

                Text("기본")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Spacer()

                HStack(spacing: 4) {
                    CapsuleButton(label: "국문", isSelected: true)
                    CapsuleButton(label: "영문", isSelected: false)
                }
            }

            HStack(spacing: 8) {
                Text("사용중인 양식:")
                    .font(.footnote)
                    .foregroundColor(.secondary)

                ToolbarChip(label: "APA 7th") {
                    viewModel.showCitationStyleView = true
                }

                FlatButton(label: "변경") {
                    viewModel.showCitationStyleView = true
                }

                Spacer()
            }

            HStack(spacing: 10) {
                FlatDropdownMenu(
                    options: ["기본", "최신 북마크순", "가나다순"],
                    selected: $selectedSorting
                ) {
                    Text(selectedSorting)
                }

                SearchInputField(text: $viewModel.searchQuery)

                Spacer()

                PrimaryActionButton(
                    title: "참고문헌 생성",
                    systemImage: "doc.text.magnifyingglass",
                    isEnabled: !viewModel.selectedItems.isEmpty
                ) {
                    viewModel.generateCitation()
                }
            }

            Divider()
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
        .background(Color(NSColor.textBackgroundColor))
    }
}


#Preview("TopToolbarView") {
    TopToolbarView(viewModel: ReferenceViewModel.mock)
        .frame(width: 960)
}
