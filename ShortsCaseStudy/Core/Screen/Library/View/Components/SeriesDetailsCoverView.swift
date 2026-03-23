//
//  ContinueWatchingVİew.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 21.03.2026.
//

import SwiftUI
import CommonModule

struct SeriesDetailsCoverView: View {
    
    let series: Series
    
    var badgeText: String {
        return series.badgeText.trimmingCharacters(in: .whitespaces)
    }
    
    var body: some View {
        HStack(spacing: AppSpacing.small) {
            imageSectionView
                .frame(width: 112)
            
            titleSectionView
        }
        .frame(maxWidth: .infinity, maxHeight: 158)
    }
    
    private var imageSectionView: some View {
        ZStack {
            backgroundImageView
            
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
    }
    
    private var titleSectionView: some View {
        VStack (alignment: .leading ,spacing: 0) {
            Spacer()
            Text("Title")
                .appFont(style: .calloutEmphasized, color: .textPrimary)
            
            Text("\(series.episodes.count - 1) episodes")
                .appFont(style: .captionCaption1Regular, color: .textTertiary)
                .padding(.top, AppSpacing.small)
            
            tagListView(series.tags)
                .padding(.top, AppSpacing.medium)
            Spacer()
        }
    }
    
    private func tagListView(_ tags: [String]) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: AppSpacing.small) {
                ForEach(tags, id: \.self) { tag in
                    Text(tag)
                        .appFont(style: .captionCaption2Emphasized, color: .textPrimary)
                        .padding(.vertical, AppSpacing.xSmall)
                        .padding(.horizontal, AppSpacing.small)
                        .background(.surfaceDisabled)
                        .clipShape(.capsule)
                }
            }
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
        .frame(width: 112, height: 158)
        .modifier(CardViewStrokeModifier(radius: AppRadius.small))
        .cornerRadius(AppSpacing.small)
    }
}

#Preview {
    
    ZStack {
        Color.surfaceBackgroundPrimary.ignoresSafeArea()
        SeriesDetailsCoverView(series: MockSeriesData.series)
            .frame(height: 158)
        .padding()
    }
    
}
