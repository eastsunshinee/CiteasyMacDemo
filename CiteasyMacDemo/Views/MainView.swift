//
//  MainView.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = ReferenceViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            Text("내 서재")
                .font(.largeTitle)
                .padding(.top)

            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.references) { item in
                        ReferenceCardView(item: item) { selected in
                            viewModel.handleCitation(for: selected)
                        }
                    }
                }
                .padding()
            }
        }
        .frame(minWidth: 500, minHeight: 400)
    }
}

#Preview {
    MainView()
}
