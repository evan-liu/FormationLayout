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
    /// wAny hAny
    case Any
    
    /// wCompact hAny
    case WCompact
    /// wRegular hAny
    case WRegular
    
    /// wAny hCompact
    case HCompact
    /// wAny hRegular
    case HRegular
    
    /// hCompact hCompact
    case BothCompact
    /// wRegular hRegular
    case BothRegular
    
    /// wCompact hRegular
    case WCompactHRegular
    /// wRegular hCompact
    case WRegularHCompact
}

/// SizeClass enum helper methods.
extension SizeClass {
    /// Check if a `UIUserInterfaceSizeClass` pair match the enum.
    /// 
    /// - Parameter hSizeClass: Horizontal size class. 
    /// - Parameter vSizeClass: Vertical size class. 
    ///
    /// - Returns: True if the `UIUserInterfaceSizeClass` pair match the `SizeClass` enum.
    internal func match(hSizeClass: UIUserInterfaceSizeClass, _ vSizeClass: UIUserInterfaceSizeClass) -> Bool {

        switch self {
        case .Any:
            return true
            
        case .WCompact:
            return hSizeClass == .Compact
        case .WRegular:
            return hSizeClass == .Regular
            
        case .HCompact:
            return vSizeClass == .Compact
        case .HRegular:
            return vSizeClass == .Regular
            
        case .BothCompact:
            return hSizeClass == .Compact && vSizeClass == .Compact
        case .BothRegular:
            return hSizeClass == .Regular && vSizeClass == .Regular
            
        case .WCompactHRegular:
            return hSizeClass == .Compact && vSizeClass == .Regular
        case .WRegularHCompact:
            return hSizeClass == .Regular && vSizeClass == .Compact
        }
    }
}