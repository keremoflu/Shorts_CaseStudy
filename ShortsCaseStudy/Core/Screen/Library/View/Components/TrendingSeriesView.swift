//
//  TrendingSeriesView.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 21.03.2026.
//

import SwiftUI

struct TrendingSeriesView: View {
    let series: Series
    let rank: Int

    var body: some View {
        
            HStack(alignment: .center, spacing: -20) {
                StrokeText(text: "\(rank)", width: 1, color: .borderTertiary)
                    .foregroundStyle(.trendingText)
                    .font(.system(size: 120, weight: .heavy))

                SeriesCoverView(series: series)
                .frame(width: 112)
            }
        .frame(width: 152, alignment: .leading)
    }
}

struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color

    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}

#Preview {
    ZStack {
        Color.surfaceBackgroundPrimary.ignoresSafeArea()
        TrendingSeriesView(series: MockSeriesData.series, rank: 1)
    }
}
