//
//  RefernceItem.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import Foundation

struct ReferenceItem: Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let year: String
    let isSelected: Bool
    var citationText: String {
        "[\(author), \(year)]"
    }
}
