//
//  Extension+View.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 20.03.2026.
//

import Foundation
import SwiftUI
import CommonModule

extension View {
    func appFont(style: FontStyle, color: Color) -> some View {
        self
            .modifier(AppTextStyle(
                fontStyle: style,
                color: color)
            )
    }
    
    @ViewBuilder
    func applyGlassEffect(shape: some Shape = .capsule) -> some View {
        if #available(iOS 26.0, *) {
            self.glassEffect(.regular, in: shape)
        } else {
            self
        }
    }
    
    func hideKeyboardOnTap() -> some View {
        self.onTapGesture {
            UIApplication.shared.sendAction(
                #selector(UIResponder.resignFirstResponder),
                to: nil, from: nil, for: nil
            )
        }
    }
}
