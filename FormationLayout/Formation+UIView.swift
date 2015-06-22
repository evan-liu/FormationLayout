//
//  ViewFormation+UIView.swift
//  FormationLayout
//
//  Created by Evan on 20/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import Foundation

// See tests in ViewFormation+UIViewTests.swift

/// Protocol for fomrations that take `UIView` to create constraints.
///
/// Helper methods are all `relatedBy: .Equal`.
/// Use full defined `attribute()` method instead to have more control.
public protocol FormationTakesUIView {
    
    /// `NSLayoutConstraint` factory method with another `UIView' to match an attribute.
    func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, toView secondView: UIView, priority: UILayoutPriority, handler: ((NSLayoutConstraint) -> Void)?) -> Self
    
    /// `NSLayoutConstraint` factory method with another `UIView' to match attributes.
    func attributes(attributes: [NSLayoutAttribute], relatedBy relation: NSLayoutRelation, toView secondView: UIView, priority: UILayoutPriority, handler: ((NSLayoutConstraint) -> Void)?) -> Self
}

extension FormationTakesUIView {
    public func centerX(secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.CenterX, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
    }
    public func centerY(secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.CenterY, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
    }
    public func center(secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attributes([.CenterX, .CenterY], relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
    }
}

extension FormationTakesUIView {
    public func width(secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Width, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
    }
    public func height(secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Height, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
    }
    public func size(secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attributes([.Width, .Height], relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
    }
}

extension FormationTakesUIView {
    public func top(secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Top, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
    }
    public func bottom(secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Bottom, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
    }
    public func leading(secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Leading, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
    }
    public func trailing(secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Trailing, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
    }
    public func baseline(secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Baseline, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
    }
}