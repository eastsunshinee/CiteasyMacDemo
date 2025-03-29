//
//  SidebarIconButton.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import SwiftUI

struct SidebarIconButton: View {
    let tab: SidebarTab
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: tab.iconName)
                    .font(.system(size: 18, weight: .semibold))
                Text(tab.rawValue)
                    .font(.system(size: 13, weight: .semibold))
            }
            .foregroundColor(isSelected ? .white : .gray)
            .padding(.vertical, 10)
            .padding(.horizontal, 6)
            .frame(maxWidth: .infinity)
            .background(isSelected ? Color.accentColor : Color.clear)
            .cornerRadius(10)
        }
        .buttonStyle(.plain)
    }
}
