//
//  SeriesDetailViewModel.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 22.03.2026.
//

import Foundation
import Combine
import SwiftUI

final class SeriesDetailViewModel: ObservableObject {
    
    let series: Series
    private let seriesService: SeriesServiceProtocol
    
    private var hasFetched = false
    
    @Published var isPlayEpisodeEnabled: Bool = false
    @Published var selectedEpisodeID: String?
    @Published var isAddedToList: Bool = false
    @Published var isDescriptionExpanded: Bool = false
    @Published var isShareLoading: Bool = false
    @Published var episodes: [Series.Episode] = []
    
    init(series: Series, seriesService: SeriesServiceProtocol) {
        self.series = series
        self.seriesService = seriesService
    }
    
    func fetchSeriesDetails() async {
        
        if let cachedList = getCachedEpisodes() {
            await updateEpisodes(cachedList)
        } else {
            await fetchEpisodesFromService()
        }
    }
    
    private func fetchEpisodesFromService() async {
        guard !hasFetched else { return }
        hasFetched = true
        
        do {
            let episodeList = try await seriesService.fetchSeriesEpisodes(by: series.id)
            addEpisodeCache(series, episodeList)
            await MainActor.run { episodes = episodeList }
            await updateEpisodes(episodeList)
        } catch {
            hasFetched = false
        }
    }
    
    private func getCachedEpisodes() -> [Series.Episode]? {
        return EpisodeCacheManager.shared.getEpisodeList(for: series)
    }
    
    private func updateEpisodes(_ episodes: [Series.Episode]) async {
        await MainActor.run {
            self.episodes = episodes
        }
    }
    
    private func addEpisodeCache(_ series: Series, _ list: [Series.Episode]) {
        EpisodeCacheManager.shared.addToCache(series, episodeList: list)
    }
    
    func handleOnLocked(_ episode: Series.Episode) {
        //
    }
    
    func handleUnlockable(_ episode: Series.Episode) {
        //
    }
    
    func handleEpisodeSelection(_ episode: Series.Episode) {
        selectedEpisodeID = episode.id
        isPlayEpisodeEnabled = episode.isFree || episode.isTrailer || !episode.isLocked
    }
    
    func getShareText() -> String {
        return "Check out new series \(series.title) from \(Constants.appName)!"
    }
    
}
