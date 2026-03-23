//
//  LinearProgressViewStyle.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 21.03.2026.
//

import SwiftUI

struct LinearProgressViewStyle: ProgressViewStyle {
    
    let progress: Int
    let trackColor: Color
    let progressColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { geometry in
            ZStack (alignment: .leading) {
                Capsule()
                    .fill(trackColor)
                
                Rectangle()
                    .fill(progressColor)
                    .frame(width: geometry.size.width * (configuration.fractionCompleted ?? 0.0))
                
            }
            .clipShape(.capsule)
        }
    }
}

#Preview {
    ProgressView(value: 0.8)
        .progressViewStyle(LinearProgressViewStyle(progress: 50, trackColor: .blackOpacity20, progressColor: .surfacePrimary))
        .frame(height: 8)
}
