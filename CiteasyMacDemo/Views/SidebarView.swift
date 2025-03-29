//
//  SidebarView.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import SwiftUI

enum SidebarTab: String, CaseIterable {
    case library = "내 서재"
    case citationStyle = "인용 양식"
    case settings = "설정"

    var iconName: String {
        switch self {
        case .library: return "quote.bubble.fill"
        case .citationStyle: return "textformat.size"
        case .settings: return "gearshape.fill"
        }
    }
}

struct SidebarView: View {
    @Binding var selectedTab: SidebarTab

    var body: some View {
        VStack {
            // 상단 주요 탭
            VStack(spacing: 16) {
                let topTabs: [SidebarTab] = [.library, .citationStyle, .settings]
                ForEach(topTabs, id: \.self) { tab in
                    SidebarIconButton(tab: tab,
                                      isSelected: selectedTab == tab) {
                        selectedTab = tab
                    }
                }
            }
            .padding(.top, 32)

            Spacer()

            // 하단 버튼 (reload & help)
            VStack(spacing: 16) {
                Button(action: {
                    // 예: 새로고침 로직
                    print("🔄 새로고침 동작 실행")
                }) {
                    Image(systemName: "arrow.clockwise")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.primary)
                        .padding(10)
                        .background(Circle().fill(Color.gray.opacity(0.2)))
                }
                .buttonStyle(PlainButtonStyle())
                .help("새로고침")

                Button(action: {
                    // 예: 외부 도움말 페이지 열기
                    if let url = URL(string: "https://aerial-drop-0a5.notion.site/cdfb3487381d4ab09d2ee9e499a3e67d?v=44dc8bf728c6413aa475a7f767d826e0") {
                        NSWorkspace.shared.open(url)
                    }
                }) {
                    Image(systemName: "questionmark.circle")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.primary)
                        .padding(10)
                        .background(Circle().fill(Color.gray.opacity(0.2)))
                }
                .buttonStyle(PlainButtonStyle())
                .help("도움말")
            }
            .padding(.bottom, 24)

        }
        .padding(.horizontal, 12)
        .frame(minWidth: 100, maxWidth: 120)
        .background(Color(nsColor: .windowBackgroundColor))
    }
}

// MARK: - Preview

#Preview {
    struct SidebarWrapper: View {
        @State private var tab: SidebarTab = .library
        var body: some View {
            SidebarView(selectedTab: $tab)
                .frame(height: 600)
        }
    }

    return SidebarWrapper()
        .preferredColorScheme(.dark)
}

