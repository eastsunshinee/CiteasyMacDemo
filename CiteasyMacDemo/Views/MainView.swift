//
//  MainView.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = ReferenceViewModel()

    @State private var selectedItem: ReferenceItem?
    @State private var selectedStyle = "APA"
    @State private var selectedLanguage = "국문"
    @State private var selectedSort = "작성일순"

    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                TopToolbarView()
                Divider()

                ReferenceListView(
                    items: viewModel.references,
                    onCite: { item in
                        viewModel.handleCitation(for: item)
                    }
                )
                .onTapGesture {
                    // 더 정교한 바인딩이 필요하면 ForEach 내부에 직접 onTapGesture 삽입
                }
            }
            .frame(minWidth: 500)

            Divider()

            ReferenceDetailView(item: selectedItem)
        }
        .frame(minWidth: 800, minHeight: 500)
    }
}


#Preview {
    MainView()
}
