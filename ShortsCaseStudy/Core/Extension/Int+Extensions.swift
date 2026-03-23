//
//  Int+Extensions.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 22.03.2026.
//

import Foundation

extension Int {
    var seriesViewCountFormat: String {
        switch self {
        case 0..<1_000:
            return "\(self)"
        case 1_000..<1_000_000:
            let value = Double(self) / 1_000
            return value.truncatingRemainder(dividingBy: 1) == 0
                ? "\(Int(value))K"
                : String(format: "%.1fK", value)
        default:
            let value = Double(self) / 1_000_000
            return value.truncatingRemainder(dividingBy: 1) == 0
                ? "\(Int(value))M"
                : String(format: "%.1fM", value)
        }
    }
}

