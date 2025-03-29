//
//  CitationStyleView.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import SwiftUI

struct CitationStyleView: View {
    var body: some View {
        Text("인용 양식 화면")
            .font(.title)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue.opacity(0.05))
    }
}

#Preview {
    CitationStyleView()
}
