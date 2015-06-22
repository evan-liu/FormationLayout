//
//  GroupFormation+SameSize.swift
//  FormationLayout
//
//  Created by Evan on 22/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

/// GroupFormation extension that make the views have the same size.
/// Use when you want the views to fill some space equally.
extension GroupFormation {
    
    /// Make all views have the same width.
    public func sameWidth(priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {

        for i in 1 ..< viewFormations.count {
            viewFormations[i].width(viewFormations[i - 1].view, priority: priority, handler: handler)
        }
        
        return self
    }

    /// Make all views have the same height.
    public func sameHeight(priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        for i in 1 ..< viewFormations.count {
            viewFormations[i].height(viewFormations[i - 1].view, priority: priority, handler: handler)
        }
        
        return self
    }
    
    /// Make all views have both the same width and the same height.
    public func sameSize(priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        for i in 1 ..< viewFormations.count {
            viewFormations[i].width(viewFormations[i - 1].view, priority: priority, handler: handler)
            viewFormations[i].height(viewFormations[i - 1].view, priority: priority, handler: handler)
        }
        
        return self
    }
}