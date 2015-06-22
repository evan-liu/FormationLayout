//
//  GroupFormation+Space.swift
//  FormationLayout
//
//  Created by Evan on 20/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

/// GroupFormation extension that make spaces between views.
extension GroupFormation {
    
    /// Make horizontal spaces between views.
    public func hSpace(space: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        for i in 1 ..< viewFormations.count {
            viewFormations[i].leading(viewFormations[i - 1].view.trailing + space, priority: priority, handler: handler)
        }
        return self
    }

    /// Make vertical spaces between views.
    public func vSpace(space: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        for i in 1 ..< viewFormations.count {
            viewFormations[i].top(viewFormations[i - 1].view.bottom + space, priority: priority, handler: handler)
        }
        return self
    }
}