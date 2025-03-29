//
//  LibraryView.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import SwiftUI

struct LibraryView: View {
    @ObservedObject var viewModel: ReferenceViewModel

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                TopToolbarView(viewModel: viewModel)

                // ✅ 참조 리스트 뷰로 교체
                ReferenceListView(
                    items: viewModel.references,
                    selectedItems: viewModel.selectedItems,
                    onToggle: { viewModel.toggleSelection(for: $0) },
                    onCite: { viewModel.handleCitation(for: $0) }
                )
                .background(Color(NSColor.textBackgroundColor)) // ✅ 다크/라이트 대응 배경
            }

            if !viewModel.selectedReferenceItems.isEmpty {
                PreviewPanelView(
                    previewText: viewModel.selectedReferenceItems.map { $0.citationText }.joined(separator: "\n"),
                    onEdit: {
                        // TODO
                    },
                    onCite: {
                        for item in viewModel.selectedReferenceItems {
                            viewModel.handleCitation(for: item)
                        }
                        withAnimation {
                            viewModel.selectedItems.removeAll()
                        }
                    }
                )
                .transition(.move(edge: .bottom).combined(with: .opacity)) // ✅ 애니메이션
                .animation(.easeInOut, value: viewModel.selectedItems)
            }
        }
    }
}

#Preview {
    LibraryView(viewModel: ReferenceViewModel.mock)
}
