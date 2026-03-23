//
//  ForYouView.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 20.03.2026.
//

import SwiftUI

struct ForYouView: View {
    var body: some View {
        ZStack {
            Color.surfaceBackgroundPrimary.ignoresSafeArea()
            Text("For you view")
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    ForYouView()
}
