//
//  ViewFormation+UIView.swift
//  FormationLayout
//
//  Created by Evan on 20/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import Foundation

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