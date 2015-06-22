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

/// Extension helper methods to add constraints to some especial elements
extension GroupFormation {
    
    public func firstTop(secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {

        viewFormations.first!.attribute(.Top, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
        return self
    }
    public func firstTop(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        viewFormations.first!.attribute(.Top, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    
    public func firstLeading(secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        viewFormations.first!.attribute(.Leading, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
        return self
    }
    public func firstLeading(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        viewFormations.first!.attribute(.Leading, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    
    public func lastBottom(secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        viewFormations.last!.attribute(.Bottom, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
        return self
    }
    public func lastBottom(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        viewFormations.last!.attribute(.Bottom, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    
    public func lastTrailing(secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        viewFormations.last!.attribute(.Trailing, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
        return self
    }
    public func lastTrailing(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        viewFormations.last!.attribute(.Trailing, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
}