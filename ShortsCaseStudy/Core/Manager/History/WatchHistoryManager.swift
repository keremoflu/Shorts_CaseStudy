//
//  WatchHistoryManager.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 23.03.2026.
//

import Foundation

final class WatchHistoryManager: WatchHistoryProtocol {
    static let shared = WatchHistoryManager()
    private init() { }
    
    func getHistory(for series: Series) -> HistoryItem {
        return HistoryItem(
            seriesID: series.id,
            lastEpisodeIndex: Int.random(in: 1...series.episodes.count - 1),
            currentDuration: Int.random(in: 1...100))
    }
}
