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
public protocol FormationTakesUIView {
    /// `NSLayoutConstraint` factory method with another `UIView' to match an attribute.
    func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, toView secondView: UIView, priority: UILayoutPriority, handler: ((NSLayoutConstraint) -> Void)?) -> Self

    /// `NSLayoutConstraint` factory method with another `UIView' to match attributes.
    func attributes(attributes: [NSLayoutAttribute], relatedBy relation: NSLayoutRelation, toView secondView: UIView, priority: UILayoutPriority, handler: ((NSLayoutConstraint) -> Void)?) -> Self
}

extension FormationTakesUIView {
    public func centerX(secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        attribute(.CenterX, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
        return self
    }
    public func centerY(secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        attribute(.CenterY, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
        return self
    }
    public func center(secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        attributes([NSLayoutAttribute.CenterX, NSLayoutAttribute.CenterY], relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
        return self
    }
}

extension FormationTakesUIView {
    public func top(secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        attribute(.Top, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
        return self
    }
    public func bottom(secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        attribute(.Bottom, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
        return self
    }
    public func leading(secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        attribute(.Leading, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
        return self
    }
    public func trailing(secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        attribute(.Trailing, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
        return self
    }
    public func baseline(secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        attribute(.Baseline, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
        return self
    }
}