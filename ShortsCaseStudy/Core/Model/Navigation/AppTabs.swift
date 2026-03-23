//
//  AppTabs.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 20.03.2026.
//

import Foundation
import DeveloperToolsSupport

enum AppTabs {
    case library
    case forYou
    case myList
    case rewards
    case search
    
    var text: String {
        switch self {
        case .library:
            return "Library"
        case .forYou:
            return "For You"
        case .myList:
            return "My List"
        case .rewards:
            return "Rewards"
        case .search:
            return "Search"
        }
    }
    
    var imageResource: ImageResource {
        switch self {
        case .library:
            return .tabLibrary
        case .forYou:
            return .tabForyou
        case .myList:
            return .tabMylist
        case .rewards:
            return .tabReward
        case .search:
            return .tabSearch
        }
    }
    
    var activeImageName: String {
        switch self {
        case .library:  "tab_library"
        case .forYou:   "tab_foryou"
        case .myList:   "tab_mylist"
        case .rewards:  "tab_reward"
        case .search:   "magnifyingglass"
        }
    }
    
    var inactiveImageName: String {
        switch self {
        case .library:
            return "tab_library_unselected"
        case .forYou:
            return "tab_foryou_unselected"
        case .myList:
            return "tab_mylist_unselected"
        case .rewards:
            return "tab_reward"
        case .search:
            return "magnifyingglass"
        }
    }
}
