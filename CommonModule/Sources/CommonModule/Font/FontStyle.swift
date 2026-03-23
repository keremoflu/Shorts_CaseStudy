//
//  File.swift
//  CommonModule
//
//  Created by Kerem on 22.03.2026.
//

import Foundation
import SwiftUI

public enum FontStyle {
    case largeTitleRegular
    case largeTitleEmphasized
    case title1Regular
    case title1Emphasized
    case title2Regular
    case title2Emphasized
    case title3Regular
    case title3Emphasized
    case bodyRegular
    case bodyEmphasized
    case calloutRegular
    case calloutEmphasized
    case captionCaption1Regular
    case captionCaption1Emphasized
    case captionCaption2Regular
    case captionCaption2Emphasized
    
    public var font: Font {
        switch self {
        case .largeTitleRegular:
            return .system(size: 34, weight: .regular)
        case .largeTitleEmphasized:
            return .system(size: 34, weight: .bold)
        case .title1Regular:
            return .system(size: 28, weight: .regular)
        case .title1Emphasized:
            return .system(size: 28, weight: .bold)
        case .title2Regular:
            return .system(size: 22, weight: .regular)
        case .title2Emphasized:
            return .system(size: 22, weight: .bold)
        case .title3Regular:
            return .system(size: 20, weight: .regular)
        case .title3Emphasized:
            return .system(size: 20, weight: .semibold)
        case .bodyRegular:
            return .system(size: 17, weight: .regular)
        case .bodyEmphasized:
            return .system(size: 17, weight: .semibold)
        case .calloutRegular:
            return .system(size: 16, weight: .regular)
        case .calloutEmphasized:
            return .system(size: 16, weight: .semibold)
        case .captionCaption1Regular:
            return .system(size: 12, weight: .regular)
        case .captionCaption1Emphasized:
            return .system(size: 12, weight: .medium)
        case .captionCaption2Regular:
            return .system(size: 11, weight: .regular)
        case .captionCaption2Emphasized:
            return .system(size: 11, weight: .semibold)
        }
    }
    
    public var size: CGFloat {
        switch self {
        case .largeTitleRegular, .largeTitleEmphasized:
            return 34
        case .title1Regular, .title1Emphasized:
            return 28
        case .title2Regular, .title2Emphasized:
            return 22
        case .title3Regular, .title3Emphasized:
            return 20
        case .bodyRegular, .bodyEmphasized:
            return 17
        case .calloutRegular, .calloutEmphasized:
            return 16
        case .captionCaption1Regular, .captionCaption1Emphasized:
            return 12
        case .captionCaption2Regular, .captionCaption2Emphasized:
            return 11
        }
    }
    
    public var letterSpacing: CGFloat {
        switch self {
        case .largeTitleRegular, .largeTitleEmphasized:
            return 0.4
        case .title1Regular, .title1Emphasized:
            return 0.38
        case .title2Regular, .title2Emphasized:
            return -0.26
        case .title3Regular, .title3Emphasized:
            return -0.45
        case .bodyRegular, .bodyEmphasized:
            return -0.43
        case .calloutRegular, .calloutEmphasized:
            return -0.31
        case .captionCaption1Regular, .captionCaption1Emphasized:
            return 0
        case .captionCaption2Regular, .captionCaption2Emphasized:
            return 0.06
        }
    }
    
    public var lineHeight: CGFloat {
        switch self {
        case .largeTitleRegular, .largeTitleEmphasized:
            return 41
        case .title1Regular, .title1Emphasized:
            return 34
        case .title2Regular, .title2Emphasized:
            return 28
        case .title3Regular, .title3Emphasized:
            return 25
        case .bodyRegular, .bodyEmphasized:
            return 22
        case .calloutRegular, .calloutEmphasized:
            return 21
        case .captionCaption1Regular, .captionCaption1Emphasized:
            return 16
        case .captionCaption2Regular, .captionCaption2Emphasized:
            return 13
        }
    }
}
