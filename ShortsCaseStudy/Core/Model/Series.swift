//
//  Series.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 21.03.2026.
//

import Foundation

struct Series: Codable, Identifiable, Hashable {
    let id: UUID
    let title: String
    let description: String
    let genres: [String]
    let tags: [String]
    let cast: [CastMember]
    let episodes: [Episode]
    let totalEpisodes: Int
    let viewCount: Int
    let isExclusive: Bool
    let isFeatured: Bool
    let badgeText: String
    let releaseDate: Date
    let isReleased: Bool
    let createdAt: Date
    let updatedAt: Date
    
    let comingSoonCardURL: String
    let coverCompleteURL: String
    let coverNoTextURL: String
    let coverTitleURL: String
    
    struct Episode: Codable, Identifiable, Hashable {
        let id: String
        let episodeNumber: Int
        let title: String?
        let mediaURL: String
        let thumbnailURL: String?
        let durationSeconds: Int
        let isTrailer: Bool
        let isFree: Bool
        let isLocked: Bool
    }

    struct CastMember: Codable, Identifiable, Hashable {
        let id: String
        let name: String
        let role: String?
        let photoURL: String?
    }
}
