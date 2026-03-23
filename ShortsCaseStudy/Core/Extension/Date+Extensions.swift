//
//  Date+Extensions.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 21.03.2026.
//

import Foundation

extension Date {
    var shortFormDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM.d"
        return formatter.string(from: self).uppercased()
    }
}
