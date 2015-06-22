//
//  GroupFormation+Elements.swift
//  FormationLayout
//
//  Created by Evan on 22/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

/// Extension methods and properties to get elements from the group.
extension GroupFormation {
    
    /// Get the `ViewFormation` at index.
    public subscript(index:Int) -> ViewFormation {
        return viewFormations[index]
    }
    
    /// Count of the views in the group.
    public var count: Int {
        return viewFormations.count
    }
    
    /// The first `UIView` in the group
    public var firstView: UIView {
        return viewFormations.first!.view
    }
    
    /// The last `UIView` in the group
    public var lastView: UIView {
        return viewFormations.last!.view
    }
    
    /// Get view at index
    public func viewAt(index: Int) -> UIView {
        return viewFormations[index].view
    }
}