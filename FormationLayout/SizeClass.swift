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
        switch self {
        case .wAny_hAny:
            return true
        case .wAny_hCompact:
            return vSizeClass == .Compact
        case .wAny_hRegular:
            return vSizeClass == .Regular
            
        case .wCompact_hAny:
            return hSizeClass == .Compact
        case .wCompact_hCompact:
            return hSizeClass == .Compact && vSizeClass == .Compact
        case .wCompact_hRegular:
            return hSizeClass == .Compact && vSizeClass == .Regular
            
        case .wRegular_hAny:
            return hSizeClass == .Regular
        case .wRegular_hCompact:
            return hSizeClass == .Regular && vSizeClass == .Compact
        case .wRegular_hRegular:
            return hSizeClass == .Regular && vSizeClass == .Regular
        }
    }
}