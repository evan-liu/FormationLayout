//
//  ViewFormation.swift
//  FormationLayout
//
//  Created by Evan on 18/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

/// Formation class to create and manager a group of constraints of one view.
public final class ViewFormation: Formation {
    public var installSizeClasses = Set<SizeClass>()
    public var exceptSizeClasses = Set<SizeClass>()
    public var active = false {
        didSet {
            active ? NSLayoutConstraint.activateConstraints(constraints) : NSLayoutConstraint.deactivateConstraints(constraints)
        }
    }
    
    /// Created constraints for the target view.
    private(set) public var constraints = [NSLayoutConstraint]()
    
    /// Target view of the formation. Will be `firstItem` of all constraints.
    public let view: UIView
    public init(view:UIView) {
        self.view = view
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    /// Add one `NSLayoutConstraint` to the view formations.
    public func addConstraint(constraint: NSLayoutConstraint, priority: UILayoutPriority, handler: ((NSLayoutConstraint) -> Void)?) -> Void {
        constraint.priority = priority
        if let handler = handler {
            handler(constraint)
        }
        constraints.append(constraint)
    }
}