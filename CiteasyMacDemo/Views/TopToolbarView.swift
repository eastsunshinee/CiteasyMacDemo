//
//  TopToolbarView.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import SwiftUI

struct TopToolbarView: View {
    @State private var selectedStyle: String = "KCI"
    @State private var isKorean: Bool = true

    var body: some View {
        HStack(spacing: 16) {
            // 좌측: 현재 폴더명 (예시용)
            Text("내 서재")
                .font(.title3)
                .bold()
                .padding(.leading, 16)

            Spacer()

            // 인용 양식 선택
            Picker("인용 양식", selection: $selectedStyle) {
                Text("KCI").tag("KCI")
                Text("APA").tag("APA")
                Text("MLA").tag("MLA")
            }
            .pickerStyle(MenuPickerStyle())
            .frame(width: 100)

            // 국문/영문 스위치
            Toggle(isOn: $isKorean) {
                Text(isKorean ? "국문" : "영문")
                    .frame(width: 40)
            }
            .toggleStyle(SwitchToggleStyle(tint: .accentColor))
            .labelsHidden()

            Divider()
                .frame(height: 20)

            // 정렬 버튼
            Button {
                // 정렬 기능
            } label: {
                Image(systemName: "arrow.up.arrow.down")
                Text("정렬")
            }
            .buttonStyle(BorderlessButtonStyle())

            // 전체 선택
            Button {
                // 전체 선택 기능
            } label: {
                Image(systemName: "checkmark.circle")
                Text("전체 선택")
            }
            .buttonStyle(BorderlessButtonStyle())

            // 검색 필드
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("검색", text: .constant(""))
                    .textFieldStyle(PlainTextFieldStyle())
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 6)
            .background(Color(NSColor.controlBackgroundColor))
            .cornerRadius(6)

            Spacer()
                .frame(width: 16)
        }
        .padding(.vertical, 8)
        .background(Color(NSColor.windowBackgroundColor))
        .overlay(
            Divider(), alignment: .bottom
        )
    }
}

#Preview {
    TopToolbarView()
        .frame(width: 1200)
        .preferredColorScheme(.light) // 다크모드 테스트: .dark
}
