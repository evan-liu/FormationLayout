//
//  GroupFormation+Space.swift
//  FormationLayout
//
//  Created by Evan on 20/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

extension GroupFormation {
    /// Make horizontal space between views.
    public func hSpace(space: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        return forEach { current, index, group in
            if index > 0 {
                current.leading(group[index - 1].view.trailing + space, priority: priority, handler: handler)
            }
        }
    }

    /// Make vertical space between views.    
    public func vSpace(space: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        return forEach { current, index, group in
            if index > 0 {
                current.top(group[index - 1].view.bottom + space, priority: priority, handler: handler)
            }
        }
    }
}