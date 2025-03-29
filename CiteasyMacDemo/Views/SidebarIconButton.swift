//
//  SidebarIconButton.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import SwiftUI

struct SidebarIconButton: View {
    let title: String
    let icon: String
    var isSelected: Bool
    var useBackground: Bool = false
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 20, weight: .bold))
                    .frame(width: 44, height: 44)
                    .background(
                        useBackground ? Color.indigo : Color.clear
                    )
                    .foregroundColor(useBackground ? .white : .primary)
                    .cornerRadius(12)

                Text(title)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.primary)
            }
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    SidebarIconButton(
        title: "도움말",
        icon: "questionmark.circle",
        isSelected: false,
        action: {}
    )

}
