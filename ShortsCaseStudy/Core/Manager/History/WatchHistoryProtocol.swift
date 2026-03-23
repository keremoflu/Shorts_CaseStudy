//
//  WatchHistoryProtocol.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 23.03.2026.
//

import Foundation

protocol WatchHistoryProtocol {
    func getHistory(for series: Series) -> HistoryItem
}
