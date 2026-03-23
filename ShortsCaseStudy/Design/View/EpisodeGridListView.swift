//
//  EpisodePickerListView.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 22.03.2026.
//

import SwiftUI
import CommonModule

struct EpisodeGridListView: View {
    
    @Binding var episodes: [Series.Episode]
    @Binding var selectedEpisodeID: String?
    let onPlayableTap: (Series.Episode) -> Void
    let onUnlockableTap: (Series.Episode) -> Void
    let onLockedTap: (Series.Episode) -> Void
    
    private let columns = Array(
        repeating: GridItem(.flexible(), spacing: 8), count: 5
    )
    
    private let unlockableCount = 2
    
    var body: some View {
        ZStack {
            if episodes.isEmpty {
                episodeCellPlaceholderView
            } else {
                episodeCellLoadedView
            }
        }
        .transition(.opacity)
        .padding(.horizontal, AppSpacing.medium)
        .animation(.easeIn(duration: 0.25), value: episodes.isEmpty)
    }
    
    private var episodeCellLoadedView: some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(episodes, id: \.id) { episode in
                let state = episodeState(for: episode)
                
                EpisodeCellView(
                    episode: episode,
                    state: state,
                    isSelected: episode.id == selectedEpisodeID
                )
                .onTapGesture {
                    handleTap(episode: episode, state: state)
                }
            }
        }
    }
    
    private var episodeCellPlaceholderView: some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(0..<54, id: \.self) { index in
                RoundedRectangle(cornerRadius: AppRadius.small)
                    .fill(Color.surfaceBackgroundSecondary)
                    .frame(height: 56)
                    .overlay(
                        RoundedRectangle(cornerRadius: AppRadius.small)
                            .stroke(Color.borderDisabled, lineWidth: 1)
                )
            }
        }
    }
    
    private func handleTap(episode: Series.Episode, state: EpisodeState) {
        switch state {
        case .playable:
            selectedEpisodeID = episode.id
            onPlayableTap(episode)
        case .unlockable:
            onUnlockableTap(episode)
        case .locked:
            onLockedTap(episode)
        }
    }
    
    private func episodeState(for episode: Series.Episode) -> EpisodeState {
        if episode.isTrailer || episode.isFree {
            return .playable
        }
        
        if !episode.isLocked {
            return .playable
        }
        
        let lockedEpisodes = episodes
            .filter { !$0.isTrailer && !$0.isFree && $0.isLocked }
            .sorted { $0.episodeNumber < $1.episodeNumber }
        
        let unlockableIDs = Set(
            lockedEpisodes.prefix(unlockableCount).map(\.id)
        )
        
        return unlockableIDs.contains(episode.id) ? .unlockable : .locked
        }
    }

    private struct EpisodeCellView: View {
    
    let episode: Series.Episode
    let state: EpisodeState
    let isSelected: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack {
                RoundedRectangle(cornerRadius: AppRadius.small)
                    .fill(backgroundColor)
                
                RoundedRectangle(cornerRadius: AppRadius.small)
                    .stroke(borderColor, lineWidth: 1)
                
                Text(episode.isTrailer ? "Trailer" : "\(episode.episodeNumber)")
                    .appFont(
                        style: episode.isTrailer ? .captionCaption1Regular : .bodyEmphasized,
                        color: textColor
                    )
            }
            .frame(height: 56)
            
            if state == .unlockable || state == .locked {
                lockBadge
            }
        }
        .animation(.easeInOut(duration: 0.15), value: isSelected)
    }
    
    private var lockBadge: some View {
        Image(systemName: "lock.fill")
            .appFont(style: .captionCaption2Regular, color: state == .unlockable ? .whiteOpacity100 : .textDisabled)
            .padding(AppSpacing.xSmall)
            .background(state == .unlockable ? Color.surfacePrimary : .surfaceDisabled)
            .clipShape(.rect(bottomLeadingRadius: AppRadius.small, topTrailingRadius: AppRadius.small))
    }
    
    private var backgroundColor: Color {
        if isSelected { return .surfaceSecondary }
        return .surfaceBackgroundSecondary
    }
    
    private var borderColor: Color {
        if isSelected { return .borderPrimary }
        return .borderDisabled
    }
    
    private var textColor: Color {
        if isSelected { return .textPrimary }
        switch state {
        case .playable:   return .textPrimary
        case .unlockable: return .textSeconday
        case .locked:     return .textSeconday
        }
    }
}

#Preview {
    @Previewable @State var selectedID: String? = "xxx"
    
    ZStack {
        Color.surfaceBackgroundPrimary.ignoresSafeArea()
        
        EpisodeGridListView(
            episodes: .constant([]),
            selectedEpisodeID: $selectedID, onPlayableTap: { episode in
                print("OnPlayable tap: \(episode.episodeNumber)")
            }, onUnlockableTap: { episode in
                print("Unlockable tap: \(episode.episodeNumber)")
            },
            onLockedTap: { episode in
                print("Locked episode tapped: \(episode.episodeNumber)")
            }
        )
    }
}
