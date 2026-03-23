//
//  ContinueWatchingVİew.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 21.03.2026.
//

import SwiftUI
import CommonModule

struct SeriesCoverView: View {
    
    let series: Series
    var badgeText: String {
        return series.badgeText.trimmingCharacters(in: .whitespaces)
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: AppSpacing.small) {
            ZStack {
                backgroundImageView
                    .frame(height: 158)
                
                VStack {
                    HStack {
                        Spacer()
                        badgeView
                            .padding(AppSpacing.xSmall)
                    }
                    Spacer()
                    
                    HStack {
                        Spacer()
                        watchCountView
                            .padding(AppSpacing.small)
                    }
                    .background(
                        bottomLinearGradientView
                        .frame(height: 32)
                    )
                    
                }
            }
            .frame(height: 158)
            
            Text(series.title)
                .appFont(style: .captionCaption1Emphasized, color: .textPrimary)
                .lineLimit(2)
        }
            
    }
    
    private var bottomLinearGradientView: some View {
        LinearGradient(
            colors: [
            .blackOpacity60, .black.opacity(0)
        ], startPoint: .bottom, endPoint: .top)
        .clipShape(.rect(
            bottomLeadingRadius: AppRadius.small,
            bottomTrailingRadius: AppRadius.small
        ))
    }
    
    @ViewBuilder
    private var badgeView: some View {
        if !badgeText.isEmpty {
            Text(badgeText)
                .lineLimit(1)
                .appFont(style: .captionCaption2Emphasized, color: .textPrimary)
                .padding(.vertical, 5)
                .padding(.horizontal, AppSpacing.xSmall)
                .background(.surfacePrimary)
                .cornerRadius(AppRadius.xSmall)
        }
    }
    
    private var watchCountView: some View {
        HStack (spacing: AppSpacing.xSmall) {
            Image(systemName: "play.fill")
            Text(series.viewCount.seriesViewCountFormat)
                .lineLimit(1)
        }.appFont(style: .captionCaption1Emphasized, color: .textPrimary)
    }
    
    private var backgroundImageView: some View {
        FadeAsyncImage(url: series.coverCompleteURL, contentMode: .fill)
            .background(.surfaceBackgroundSecondary)
        .modifier(CardViewStrokeModifier(radius: AppRadius.small))
        .cornerRadius(AppSpacing.small)
        .clipped()
    }
    
}

#Preview {
    
    ZStack {
        Color.surfaceBackgroundPrimary.ignoresSafeArea()
        SeriesCoverView(series: MockSeriesData.series)
            .frame(width: 112, height: 158)
        .padding(32)
        .scaleEffect(2)
    }
    
}
