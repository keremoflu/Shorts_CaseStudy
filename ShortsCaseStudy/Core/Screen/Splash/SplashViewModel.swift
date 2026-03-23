//
//  SplashViewModel.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 22.03.2026.
//

import Foundation
import Combine
import SwiftUI

@MainActor
final class SplashViewModel: ObservableObject {
    
    private let prioritySections: [SectionType] = [.carousel, .continueWatching, .comingSoon]
    
    @Published var isReady = false
    
    func prefetch(store: SeriesStore) async {
        try? await Task.sleep(for: .seconds(2))
        store.prefetch(prioritySections)
        isReady = true
    }
}
