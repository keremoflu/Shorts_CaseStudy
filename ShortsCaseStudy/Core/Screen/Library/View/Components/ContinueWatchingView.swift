//
//  ContinueWatchingVİew.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 21.03.2026.
//

import SwiftUI
import CommonModule

struct ContinueWatchingView: View {
    
    let currentDuration: Int
    let currentEpisodeIndex: Int
    let series: Series
    
    var progressValue: CGFloat {
        return series.episodeProgress(
            at: currentEpisodeIndex,
            currentDuration: currentDuration
        )
    }
    
    var body: some View {
        VStack (spacing: AppSpacing.small) {
            ZStack {
                backgroundImageView
                
                VStack {
                    Spacer()
                    
                    playButtonView
                    
                    Spacer()
                    bottomSectionView
                        .padding(AppSpacing.small)
                }
            }
            
            Text(series.title)
                .appFont(style: .captionCaption1Emphasized, color: .textPrimary)
                .lineLimit(2)
        }.frame(minHeight: 182)
        
    }
    
    private var bottomSectionView: some View {
        VStack (spacing: AppSpacing.xSmall) {
            Text("EP. \(currentEpisodeIndex) / \(series.totalEpisodes)")
                .appFont(style: .captionCaption2Emphasized, color: .textPrimary)
            
            progressBarView
                .frame(height: 4)
        }
    }
    
    private var progressBarView: some View {
        ProgressView(value: progressValue)
            .progressViewStyle(LinearProgressViewStyle(
                progress: Int(progressValue) * 100,
                trackColor: .whiteOpacity20,
                progressColor: .surfacePrimary)
            )
            
    }
    
    private var playButtonView: some View {
        Image(systemName: "play.fill")
            .appFont(style: .captionCaption1Emphasized, color: .textPrimary)
            .padding(.horizontal, 5)
            .padding(AppSpacing.small)
            .background(Circle())
            .foregroundStyle(.surfacePrimary)
    }
    
    private var backgroundImageView: some View {
        FadeAsyncImage(url: series.coverCompleteURL, contentMode: .fill)
            .frame(height: 158)
       
        .modifier(CardViewStrokeModifier(radius: AppRadius.small))
        .overlay {
            Color.blackOpacity50
        }
        .cornerRadius(AppSpacing.small)
    }
    
}

#Preview {
    
    ZStack {
        Color.surfaceBackgroundPrimary.ignoresSafeArea()
        ContinueWatchingView(currentDuration: 29, currentEpisodeIndex: 0 ,series: MockSeriesData.series)
            .frame(width: 112, height: 182)
            .scaleEffect(2)
        .padding(32)
    }
    
}
