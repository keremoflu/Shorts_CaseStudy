//
//  MockSeriesData.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 21.03.2026.
//

import Foundation

struct MockSeriesData {
    static let series = Series(
        id: UUID(),
        title: "Billionaire CEO VS. Mafia King",
        description: "When a ruthless tech billionaire's empire crosses paths with the underground mafia, a deadly power struggle erupts. Betrayal, ambition, and dark secrets collide in this gripping short series.",
        genres: ["Thriller", "Crime", "Drama"],
        tags: ["Power", "Mafia", "Billionaire"],
        cast: [
            Series.CastMember(id: "1", name: "Noah Fearnley", role: "Ethan", photoURL: nil),
            Series.CastMember(id: "2", name: "Rebecca Stoughton", role: "Clara", photoURL: nil),
            Series.CastMember(id: "3", name: "James Chen", role: "Marcus", photoURL: nil),
            Series.CastMember(id: "4", name: "Sofia Alvarez", role: "Luna", photoURL: nil)
        ],
        episodes: [
            Series.Episode(
                id: "e_001",
                episodeNumber: 0,
                title: "Trailer",
                mediaURL: "https://example.com/media/billionaire-vs-mafia-trailer.mp4",
                thumbnailURL: "https://example.com/thumbs/trailer.jpg",
                durationSeconds: 58,
                isTrailer: true,
                isFree: true,
                isLocked: false
            ),
            Series.Episode(
                id: "e_002",
                episodeNumber: 1,
                title: "The Deal",
                mediaURL: "https://example.com/media/billionaire-vs-mafia-ep01.mp4",
                thumbnailURL: "https://example.com/thumbs/ep01.jpg",
                durationSeconds: 195,
                isTrailer: false,
                isFree: true,
                isLocked: false
            ),
            Series.Episode(
                id: "e_003",
                episodeNumber: 2,
                title: "Blood Money",
                mediaURL: "https://example.com/media/billionaire-vs-mafia-ep02.mp4",
                thumbnailURL: "https://example.com/thumbs/ep02.jpg",
                durationSeconds: 210,
                isTrailer: false,
                isFree: false,
                isLocked: true
            ),
            Series.Episode(
                id: "e_004",
                episodeNumber: 3,
                title: "Double Cross",
                mediaURL: "https://example.com/media/billionaire-vs-mafia-ep03.mp4",
                thumbnailURL: "https://example.com/thumbs/ep03.jpg",
                durationSeconds: 185,
                isTrailer: false,
                isFree: false,
                isLocked: true
            ),
            Series.Episode(
                id: "e_008", episodeNumber: 7, title: "The Betrayal",
                mediaURL: "https://example.com/media/ep07.mp4",
                thumbnailURL: "https://example.com/thumbs/ep07.jpg",
                durationSeconds: 205, isTrailer: false, isFree: false, isLocked: true
            ),
            Series.Episode(
                id: "e_009", episodeNumber: 8, title: "No Way Out",
                mediaURL: "https://example.com/media/ep08.mp4",
                thumbnailURL: "https://example.com/thumbs/ep08.jpg",
                durationSeconds: 188, isTrailer: false, isFree: false, isLocked: true
            ),
            Series.Episode(
                id: "e_010", episodeNumber: 9, title: "Dark Alliance",
                mediaURL: "https://example.com/media/ep09.mp4",
                thumbnailURL: "https://example.com/thumbs/ep09.jpg",
                durationSeconds: 215, isTrailer: false, isFree: false, isLocked: true
            ),
            Series.Episode(
                id: "e_011", episodeNumber: 10, title: "The Fallout",
                mediaURL: "https://example.com/media/ep10.mp4",
                thumbnailURL: "https://example.com/thumbs/ep10.jpg",
                durationSeconds: 198, isTrailer: false, isFree: false, isLocked: true
            )
        ],
        totalEpisodes: 8,
        viewCount: 1_320_000,
        isExclusive: true,
        isFeatured: true,
        badgeText: "NEW",
        releaseDate: Calendar.current.date(from: DateComponents(year: 2026, month: 3, day: 15))!,
        isReleased: true,
        createdAt: Calendar.current.date(from: DateComponents(year: 2026, month: 1, day: 10))!,
        updatedAt: Calendar.current.date(from: DateComponents(year: 2026, month: 3, day: 20))!,
        comingSoonCardURL: "https://firebasestorage.googleapis.com/v0/b/shortsapp-a78d1.firebasestorage.app/o/Series%2FEscaping_My_Ex_Husband%2FComingSoonCard.jpg?alt=media&token=8c6b000d-cf8d-4361-a11f-e5fed09d52a0",
        coverCompleteURL: "https://firebasestorage.googleapis.com/v0/b/shortsapp-a78d1.firebasestorage.app/o/Series%2FEscaping_My_Ex_Husband%2FCoverComplete.jpg?alt=media&token=055e1d2e-3949-4ac4-adc9-961e0c5fb381",
        coverNoTextURL: "https://firebasestorage.googleapis.com/v0/b/shortsapp-a78d1.firebasestorage.app/o/Series%2FEscaping_My_Ex_Husband%2FCoverNoText.jpg?alt=media&token=86fb2f0f-e719-490b-8692-0b40f33b5d8b",
        coverTitleURL: "https://firebasestorage.googleapis.com/v0/b/shortsapp-a78d1.firebasestorage.app/o/Series%2FEscaping_My_Ex_Husband%2FCoverTitle.png?alt=media&token=fcd901f5-0255-42f1-8d77-344360d1c7af"
    )
}
