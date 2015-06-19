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
    
    /// If constraints are active on one size class.
    func checkSizeClass(hSizeClass: UIUserInterfaceSizeClass, _ vSizeClass: UIUserInterfaceSizeClass) -> Bool
    
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