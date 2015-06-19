//
//  SizeClass.swift
//  FormationLayout
//
//  Created by Evan on 19/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

/// Sizeclas enum.
public enum SizeClass {
    case wAny_hAny, wAny_hCompact, wAny_hRegular
    case wCompact_hAny, wCompact_hCompact, wCompact_hRegular
    case wRegular_hAny, wRegular_hCompact, wRegular_hRegular
}

internal extension SizeClass {
    internal func match(hSizeClass: UIUserInterfaceSizeClass, _ vSizeClass: UIUserInterfaceSizeClass) -> Bool {
        switch (hSizeClass, vSizeClass) {
            
        case (.Unspecified, .Unspecified):
            return true
        case (.Unspecified, .Compact):
            switch self {
            case .wAny_hCompact, .wCompact_hCompact, .wRegular_hCompact: return true
            default: return false
            }
        case (.Unspecified, .Regular):
            switch self {
            case .wAny_hRegular, .wCompact_hRegular, .wRegular_hRegular: return true
            default: return false
            }
            
        case (.Compact, .Unspecified):
            switch self {
            case .wCompact_hAny, .wCompact_hCompact, .wCompact_hRegular : return true
            default: return false
            }
        case (.Compact, .Compact):
            return self == .wCompact_hCompact
        case (.Compact, .Regular):
            return self == .wCompact_hRegular
            
        case (.Regular, .Unspecified):
            switch self {
            case .wRegular_hAny, .wRegular_hCompact, .wRegular_hRegular : return true
            default: return false
            }
        case (.Regular, .Compact):
            return self == .wRegular_hCompact
        case (.Regular, .Regular):
            return self == .wRegular_hRegular
        }
    }
}