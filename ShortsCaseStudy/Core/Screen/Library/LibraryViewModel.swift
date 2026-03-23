//
//  LibraryViewModel.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 22.03.2026.
//

import Foundation
import Combine
import SwiftUI

final class LibraryViewModel: ObservableObject {
    
    private let seriesService: SeriesServiceProtocol
    
    @Published var sectionData: [SectionType: [Series]] = [:]
    @Published var loadingStates: [SectionType: Bool] = [:]
    
    private var fetchedSections: Set<SectionType> = []
    
    let allSections: [SectionType] = [
        .carousel, .continueWatching, .trending,
        .comingSoon, .onlyOnShorts, .topPicks, .newOnShorts
    ]
    
    init(
        seriesService: SeriesServiceProtocol = MockSeriesService.shared,
        prefetchedData: [SectionType: [Series]] = [:]
    ) {
        self.seriesService = seriesService
        
        self.sectionData = prefetchedData
        self.fetchedSections = Set(prefetchedData.keys)
    }
    
    func loadSectionIfNeeded(_ section: SectionType) {
        guard !fetchedSections.contains(section) else { return }
        fetchedSections.insert(section)
        
        loadingStates[section] = true
        
        Task {
            do {
                let series = try await seriesService.fetchSeries(for: section)
                await MainActor.run {
                    sectionData[section] = series
                    loadingStates[section] = false
                }
            } catch {
                await MainActor.run {
                    loadingStates[section] = false
                    fetchedSections.remove(section)
                }
            }
        }
    }
    
    func seriesList(for section: SectionType) -> [Series] {
        sectionData[section] ?? []
    }
    
    func isLoading(for section: SectionType) -> Bool {
        loadingStates[section] ?? false
    }
}
