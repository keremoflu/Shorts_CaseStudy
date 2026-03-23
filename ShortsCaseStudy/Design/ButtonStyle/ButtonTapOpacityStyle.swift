//
//  ButtonTapOpacityStyle.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 21.03.2026.
//

import SwiftUI

struct ButtonTapOpacityStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.7 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

