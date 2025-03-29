//
//  LibraryView.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        Text("내 서재 화면")
            .font(.title)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue.opacity(0.05))
    }
}

#Preview {
    LibraryView()
}
