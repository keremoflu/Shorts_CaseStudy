//
//  AppNavigation.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 22.03.2026.
//

import Foundation
import Combine
import SwiftUI

final class AppNavigation: ObservableObject {
    static let shared = AppNavigation()
    
    @Published var currentDestination: AppDestination = .splash
    @Published var navigationPath = NavigationPath()
    
    func navigate(to destination: AppDestination) {
        navigationPath.append(destination)
    }
    
    func popToRoot() {
        navigationPath = NavigationPath()
    }
    
    func pop() {
        if !navigationPath.isEmpty {
            navigationPath.removeLast()
        }
    }
}
