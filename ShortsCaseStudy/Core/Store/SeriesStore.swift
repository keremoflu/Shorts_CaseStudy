//
//  SeriesStore.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 22.03.2026.
//

import Foundation
import Combine
import SwiftUI

final class SeriesStore: ObservableObject {
    
    private let seriesService: SeriesServiceProtocol
    
    @Published var myList: Set<UUID> = []
    @Published var sectionData: [SectionType: [Series]] = [:]
    @Published var loadingStates: [SectionType: Bool] = [:]
    
    private var fetchedSections: Set<SectionType> = []
    
    init(seriesService: SeriesServiceProtocol = MockSeriesService.shared) {
        self.seriesService = seriesService
    }
    
    func isInMyList(_ id: UUID) -> Bool {
        return myList.contains(id)
    }
    
    func toggleMyList(_ id: UUID) {
        if myList.contains(id) {
            myList.remove(id)
        } else {
            myList.insert(id)
        }
    }
    
    func loadSectionIfNeeded(_ section: SectionType) {
        guard !fetchedSections.contains(section) else { return }
        fetchedSections.insert(section)
        loadingStates[section] = true
        
        Task {
            do {
                let series = try await seriesService.fetchSeries(for: section)
                sectionData[section] = series
            } catch {
                fetchedSections.remove(section)
            }
            loadingStates[section] = false
        }
    }

    func prefetch(_ sections: [SectionType]) {
        sections.forEach { loadSectionIfNeeded($0) }
    }
    
    func seriesList(for section: SectionType) -> [Series] {
        sectionData[section] ?? []
    }
    
    func isLoading(for section: SectionType) -> Bool {
        loadingStates[section] ?? false
    }

    
    func fetchDetailSeries(by id: UUID) async throws -> Series {
        try await seriesService.fetchDetailSeries(by: id)
    }
    
    func fetchSeriesEpisodes(by id: UUID) async throws -> [Series.Episode] {
        try await seriesService.fetchSeriesEpisodes(by: id)
    }
}
