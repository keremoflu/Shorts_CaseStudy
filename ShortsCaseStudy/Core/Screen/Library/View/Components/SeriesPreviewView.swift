//
//  SeriesPreviewView.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 21.03.2026.
//

import SwiftUI

struct SeriesPreviewView: View {
    
    let series: Series
    
    var body: some View {
        ZStack(alignment: .bottom) {
            backgroundImageView
            titleImageView
                .padding(AppSpacing.normal)
        }
        .clipShape(RoundedRectangle(cornerRadius: AppRadius.medium))
        .modifier(CardViewStrokeModifier(radius: AppRadius.medium))
    }
    
    private var titleImageView: some View {
        FadeAsyncImage(url: series.coverTitleURL, placeholderColor: .clear, contentMode: .fill)
            .frame(width: 215, height: 140)
    }
    
    private var backgroundImageView: some View {
        GeometryReader { geo in
            FadeAsyncImage(url: series.coverNoTextURL, contentMode: .fill)
                .frame(width: 239, height: 407)
        }
        
    }
}

#Preview {
    ZStack {
        Color.surfaceBackgroundPrimary.ignoresSafeArea()
        HStack {
            SeriesPreviewView(series: MockSeriesData.series)
                .frame(width: 239, height: 407)
            SeriesPreviewView(series: MockSeriesData.series)
                .frame(width: 239, height: 407)
        }
    }
}
