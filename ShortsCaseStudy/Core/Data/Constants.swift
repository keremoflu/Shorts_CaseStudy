//
//  Constants.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 22.03.2026.
//

import Foundation

struct Constants {
    static let appName: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ?? "Shorts"
}
