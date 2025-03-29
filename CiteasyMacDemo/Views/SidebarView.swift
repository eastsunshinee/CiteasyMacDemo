//
//  SidebarView.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import SwiftUI

enum SidebarMenu {
    case library
    case citationStyle
    case settings
}

struct SidebarView: View {
    @Binding var selectedMenu: SidebarMenu

    var body: some View {
        VStack {
            // 상단 메뉴
            VStack(spacing: 24) {
                SidebarIconButton(
                    title: "내 서재",
                    icon: "quote.bubble",
                    isSelected: selectedMenu == .library,
                    useBackground: true
                ) {
                    selectedMenu = .library
                }

                SidebarIconButton(
                    title: "인용 양식",
                    icon: "textformat.size",
                    isSelected: selectedMenu == .citationStyle
                ) {
                    selectedMenu = .citationStyle
                }

                SidebarIconButton(
                    title: "설정",
                    icon: "gearshape",
                    isSelected: selectedMenu == .settings
                ) {
                    selectedMenu = .settings
                }
            }
            .padding(.top, 40)

            Spacer()

            // 하단 메뉴
            VStack(spacing: 24) {
                SidebarIconButton(title: "불러오기", icon: "arrow.clockwise", isSelected: false) {
                    // TODO: 액션
                }

                SidebarIconButton(title: "도움말", icon: "questionmark.circle", isSelected: false) {
                    // TODO: 액션
                }
            }
            .padding(.bottom, 24)
        }
        .frame(width: 100)
        .background(Color(nsColor: .controlBackgroundColor))
    }
}

#Preview {
    SidebarView(selectedMenu: .constant(.library))
}
