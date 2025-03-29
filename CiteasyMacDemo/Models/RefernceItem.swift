//
//  RefernceItem.swift
//  CiteasyMacDemo
//
//  Created by 김동현 on 3/29/25.
//

import Foundation

struct ReferenceItem: Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var author: String
    var year: String

    var citationText: String {
        return "[\(author)(\(year))] \(title)"
    }
}
