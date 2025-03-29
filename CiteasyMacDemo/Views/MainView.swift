//
//  MainView.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab: SidebarTab = .library

    var body: some View {
        HStack(spacing: 0) {
            SidebarView(selectedTab: $selectedTab)
                .frame(width: 120)

            Divider()

            switch selectedTab {
            case .library:
                LibraryView()
            case .citationStyle:
                CitationStyleView()
            case .settings:
                SettingsView()
            }
        }
    }
}

#Preview {
    MainView()
}
