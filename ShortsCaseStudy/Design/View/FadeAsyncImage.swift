//
//  FadeAsyncImage.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 22.03.2026.
//

import SwiftUI

struct FadeAsyncImage: View {
    let url: String?
    let placeholderColor: Color?
    let contentMode: ContentMode
    var onLoaded: (() -> Void)?
    
    @State private var image: UIImage?
    
    init(url: String?, placeholderColor: Color? = .surfaceBackgroundPrimary, contentMode: ContentMode, onLoaded: (() -> Void)? = nil) {
        self.url = url
        self.placeholderColor = placeholderColor
        self.contentMode = contentMode
        self.onLoaded = onLoaded
    }
    
    var body: some View {
        Group {
            if let image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: contentMode)
                    .transition(.opacity.animation(.easeIn(duration: 0.5)))
                    .onAppear { onLoaded?() }
            } else {
                placeholderColor
            }
        }
        .task(id: url) {
            guard let url, image == nil else { return }
            image = try? await ImageCacher.shared.download(from: url)
        }
    }
}

#Preview {
    FadeAsyncImage(url: MockSeriesData.series.coverCompleteURL, contentMode: .fill)
}
