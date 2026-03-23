//
//  ShortsCaseStudyApp.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 20.03.2026.
//

import SwiftUI

@main
struct ShortsCaseStudyApp: App {
    
    @StateObject private var navigation = AppNavigation()
    @StateObject private var seriesStore = SeriesStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
                .environmentObject(navigation)
                .environmentObject(seriesStore)
        }
    }
}
