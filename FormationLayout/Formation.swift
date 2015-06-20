//
//  Formation.swift
//  FormationLayout
//
//  Created by Evan on 20/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import Foundation

/// Protocol for formations.
public protocol Formation : class {
    /// If constraints are active.
    var active: Bool { get set }
    
    /// Installed size classes on which constraints will be active.
    var installSizeClasses: Set<SizeClass> { get set }
    
    /// Excepted size classes on which constraints will not be active.
    var exceptSizeClasses: Set<SizeClass> { get set }
}

/// Helper methods to install and except size classes.
extension Formation {
    /// Install to a size class. Constraints will only be active on installed size classes.
    /// If no size classes are installed `Any`(`wAnyhAny`) will be installed by default.
    public func install(sizeClass: SizeClass) -> Self {
        installSizeClasses.insert(sizeClass)
        return self
    }
    
    /// Constraints will not be active on the excepted size classes even if the size class is installed.
    public func except(sizeClass: SizeClass) -> Self {
        exceptSizeClasses.insert(sizeClass)
        return self
    }
}

extension Formation {
    /// Check if constraints are active on one size class by a `UIUserInterfaceSizeClass` pair.
    func checkSizeClass(hSizeClass: UIUserInterfaceSizeClass, _ vSizeClass: UIUserInterfaceSizeClass) -> Bool {
        // Not active on except size classes.
        for exceptSizeClass in exceptSizeClasses {
            if exceptSizeClass.match(hSizeClass, vSizeClass) {
                return false
            }
        }
        
        // Install to Any size class and always active by default
        if installSizeClasses.count == 0 {
            return true
        }
        
        // Active on installed size clasess.
        for installSizeClass in installSizeClasses {
            if installSizeClass.match(hSizeClass, vSizeClass) {
                return true
            }
        }
        
        // Not active on uninstalled size classes if any size classes are installed.
        return false
    }
}