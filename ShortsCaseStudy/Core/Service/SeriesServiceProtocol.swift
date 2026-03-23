//
//  SeriesServiceProtocol.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 21.03.2026.
//

import Foundation

protocol SeriesServiceProtocol {
    func fetchSeries(for section: SectionType) async throws -> [Series]
    func fetchDetailSeries(by id: UUID) async throws -> Series
    func fetchSeriesEpisodes(by id: UUID) async throws -> [Series.Episode]
}
