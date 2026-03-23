//
//  EpisodeCacheManager.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 23.03.2026.
//

import Foundation

final class EpisodeCacheManager: EpisodeCacheProtocol {
    static let shared = EpisodeCacheManager()
    private init() { }
    
    lazy var episodeList: [UUID: [Series.Episode]] = [:]
    
    func addToCache(_ series: Series, episodeList: [Series.Episode]) {
        self.episodeList[series.id] = episodeList
    }
    
    func getEpisodeList(for series: Series) -> [Series.Episode]? {
        return episodeList[series.id]
    }
    
    func clearCache() {
        episodeList.removeAll()
    }
}
