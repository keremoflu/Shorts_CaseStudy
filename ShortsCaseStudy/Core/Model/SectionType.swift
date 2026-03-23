//
//  SectionType.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 21.03.2026.
//

import Foundation

enum SectionType: String, Codable {
    case trending
    case comingSoon
    case topPicks
    case onlyOnShorts
    case carousel
    case continueWatching
    case newOnShorts
    case unknown

    init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        self = SectionType(rawValue: value) ?? .unknown
    }
}

