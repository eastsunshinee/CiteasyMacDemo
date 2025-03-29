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


            // → 선택된 탭에 따라 메인 콘텐츠 변경
//            Group {
//                switch selectedTab {
//                case .library:
//                    ReferenceListView()
//                case .citationStyle:
//                    CitationStyleView()
//                case .settings:
//                    SettingsView()
//                case .reload:
//                    ReloadView()
//                case .help:
//                    HelpView()
//                }
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}



#Preview {
    MainView()
}
