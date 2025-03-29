//
//  RefernceItem.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import Foundation

struct ReferenceItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let author: String
    let year: String

    var citationText: String {
        "\(author) (\(year)). \(title)."
    }
}
