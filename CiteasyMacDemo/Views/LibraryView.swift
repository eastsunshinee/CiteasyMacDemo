//
//  LibraryView.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import SwiftUI

struct LibraryView: View {
    @State private var selectedItems: Set<Int> = []

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // 1. 타이틀 및 탭
            HStack {
                Text("내 서재")
                    .font(.title2.bold())
                Spacer()
                Text("기본")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            // 2. 인용 양식 + 변경
            HStack(spacing: 4) {
                Text("사용중인 양식:")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("APA 7th")
                    .foregroundColor(.blue)
                Button("변경") {}
                    .font(.footnote)
            }

            // 3. 필터 및 검색
            HStack {
                Picker("필터", selection: .constant(0)) {
                    Text("최신 북마크순").tag(0)
                    Text("가나다순").tag(1)
                }
                .pickerStyle(MenuPickerStyle())

                Spacer()

                TextField("키워드, 저널, 저자 등으로 검색", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 220)
            }

            // 4. 전체 선택 + 버튼
            HStack {
                Text("전체선택 (0/69)")
                    .font(.footnote)
                Spacer()
                Button(action: {
                    // 생성 액션
                }) {
                    Text("📋 참고문헌 생성")
                        .font(.subheadline.bold())
                        .padding(.vertical, 6)
                        .padding(.horizontal, 12)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(6)
                }
            }

            Divider()

            // 5. 참고문헌 리스트
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(0..<5, id: \.self) { index in
                        ReferenceRowView(
                            title: sampleReferences[index].title,
                            author: sampleReferences[index].author,
                            isSelected: selectedItems.contains(index)
                        )
                        .onTapGesture {
                            if selectedItems.contains(index) {
                                selectedItems.remove(index)
                            } else {
                                selectedItems.insert(index)
                            }
                        }
                        Divider()
                    }
                }
            }
        }
        .padding()
    }
}

private let sampleReferences = [
    (title: "SwiftUI 앱 개발", author: "홍길동 · 2024"),
    (title: "iOS 비동기 처리", author: "김철수 · 2023"),
    (title: "애플 생태계와 Swift", author: "이영희 · 2022"),
    (title: "Combine과 MVVM", author: "박지민 · 2021"),
    (title: "iPadOS와 멀티태스킹", author: "최윤서 · 2020")
]

#Preview {
    LibraryView()
        .frame(width: 600, height: 600)
}
