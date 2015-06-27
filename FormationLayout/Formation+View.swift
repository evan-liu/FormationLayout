//
//  ViewFormation+View.swift
//  FormationLayout
//
//  Created by Evan on 20/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import Foundation

// See tests in ViewFormation+ViewTests.swift

/// Protocol for fomrations that take another `View` to create constraints.
///
/// Helper methods are all `relatedBy: .Equal`.
/// Use full defined `attribute()` method instead to have more control.
public protocol FormationTakesView {
    
    /// `NSLayoutConstraint` factory method with another `View' to match an attribute.
    func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, toView secondView: View, priority: UILayoutPriority, handler: ((NSLayoutConstraint) -> Void)?) -> Self
    
    /// `NSLayoutConstraint` factory method with another `View' to match attributes.
    func attributes(attributes: [NSLayoutAttribute], relatedBy relation: NSLayoutRelation, toView secondView: View, priority: UILayoutPriority, handler: ((NSLayoutConstraint) -> Void)?) -> Self
}

extension FormationTakesView {
    public func centerX(secondView: View, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.CenterX, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
    }
    public func centerY(secondView: View, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.CenterY, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
    }
    public func center(secondView: View, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attributes([.CenterX, .CenterY], relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
    }
}

extension FormationTakesView {
    public func width(secondView: View, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Width, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
    }
    public func height(secondView: View, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Height, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
    }
    public func size(secondView: View, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attributes([.Width, .Height], relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
    }
}

extension FormationTakesView {
    public func top(secondView: View, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Top, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
    }
    public func bottom(secondView: View, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Bottom, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
    }
    public func leading(secondView: View, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Leading, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
    }
    public func trailing(secondView: View, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Trailing, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
    }
    public func baseline(secondView: View, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Baseline, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
    }
}