//
//  EpisodeCacheProtocol.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 23.03.2026.
//

import Foundation

protocol EpisodeCacheProtocol {
    var episodeList: [UUID: [Series.Episode]] { get }
    func addToCache(_ series: Series, episodeList: [Series.Episode])
    func getEpisodeList(for series: Series) -> [Series.Episode]?
    func clearCache()
}
