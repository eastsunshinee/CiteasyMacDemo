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
    private let sortingOptions = ["기본", "최신 북마크순", "가나다순"]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // 상단 타이틀 + 언어 토글
            HStack {
                HStack(spacing: 6) {
                    Text("내 서재")
                        .font(.title3.bold())
                    Text("기본")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                Spacer()


            }

            // 인용 양식 영역
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
                HStack(spacing: 4) {
                    CapsuleButton(label: "국문", isSelected: true)
                    CapsuleButton(label: "영문", isSelected: false)
                }
                Spacer()
            }

            // 정렬 + 검색 + 버튼
            HStack(spacing: 10) {
                // 정렬 기준
                FlatDropdownMenu(options: sortingOptions, selected: $selectedSorting) {
                    Text(selectedSorting)
                }

                // 검색창
                SearchInputField(text: $viewModel.searchQuery)

                Spacer()

                // 참고문헌 생성
                PrimaryActionButton(
                    title: "참고문헌 생성",
                    systemImage: "doc.text.magnifyingglass",
                    isEnabled: !viewModel.selectedItems.isEmpty
                ) {
                    viewModel.generateCitation()
                }

                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.accentColor))
                .foregroundColor(.white)
                .font(.subheadline)
                .disabled(viewModel.selectedItems.isEmpty)
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
