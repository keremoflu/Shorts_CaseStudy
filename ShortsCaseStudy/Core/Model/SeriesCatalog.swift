//
//  SeriesCatalog.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 22.03.2026.
//

import Foundation

struct SeriesCatalog: Codable {
    let sections: [SectionMapping]
    let series: [Series]
    
    struct SectionMapping: Codable {
        let type: String
        let seriesIDs: [String]
    }
}
