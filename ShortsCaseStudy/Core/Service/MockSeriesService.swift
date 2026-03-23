//
//  LocalService.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 22.03.2026.
//

import Foundation

final class MockSeriesService: SeriesServiceProtocol {
    
    static let shared = MockSeriesService()
    
    private var catalog: SeriesCatalog?
    private let randomSeconds: Int = (0...1).randomElement() ?? 1
    
    private init() {
        loadCatalog()
    }
    
    private func loadCatalog() {
        guard let url = Bundle.main.url(forResource: "series_catalog", withExtension: "json") else {
            print("series_catalog.json not found!")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            catalog = try decoder.decode(SeriesCatalog.self, from: data)
        } catch {
            print("Failed to decode series_catalog.json: \(error.localizedDescription)!")
        }
    }
    
    private func simulateNetwork() async throws {
        try await Task.sleep(nanoseconds: 500_000_000)
    }
    
    private func allSeries() -> [Series] {
        catalog?.series ?? []
    }
    
    private func seriesLookup() -> [UUID: Series] {
        allSeries().reduce(into: [:]) { dict, series in
            dict[series.id] = series
        }
    }
    
    func fetchSeries(for section: SectionType) async throws -> [Series] {
        try await simulateNetwork()
        
        guard let catalog else {
            throw LocalServiceError.catalogNotLoaded
        }
        
        guard let mapping = catalog.sections.first(where: { $0.type == section.rawValue }) else {
            throw LocalServiceError.sectionMissing(section.rawValue)
        }
        
        let ids = Set(mapping.seriesIDs)
        return allSeries().filter { ids.contains($0.id.uuidString) }
    }
    
    func fetchDetailSeries(by id: UUID) async throws -> Series {
        try await simulateNetwork()
        
        guard let series = seriesLookup()[id] else {
            throw LocalServiceError.seriesNotFound(id)
        }
        return series
    }
    
    func fetchSeriesEpisodes(by id: UUID) async throws -> [Series.Episode] {
        try await simulateNetwork()
        
        guard let series = seriesLookup()[id] else {
            throw LocalServiceError.seriesNotFound(id)
        }
        return series.episodes
    }
}

extension MockSeriesService {
    enum LocalServiceError: LocalizedError {
        case catalogNotLoaded
        case sectionMissing(String)
        case seriesNotFound(UUID)
        
        var errorDescription: String? {
            switch self {
            case .seriesNotFound(let id):
                return "Series \(id.uuidString) Not Found Inside Catalog"
            case .catalogNotLoaded:
                return "Catalog Not Loaded"
            case .sectionMissing(let section):
                return "Section \(section) Missing"
            }
        }
    }
}
