//
//  ViewFormation+UIView.swift
//  FormationLayout
//
//  Created by Evan on 20/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import Foundation

extension ViewFormation {
    /// `NSLayoutConstraint` factory method with another `UIView' to match an attribute.
    public func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, toView secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        addConstraint(NSLayoutConstraint(item: view, attribute: attribute, relatedBy: relation, toItem: secondView, attribute: attribute, multiplier: 1, constant: 0), priority: priority, handler: handler)
        return self
    }
    
    /// `NSLayoutConstraint` factory method with another `UIView' to match attributes.
    public func attributes(attributes: [NSLayoutAttribute], relatedBy relation: NSLayoutRelation, toView secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        for attribute in attributes {
            addConstraint(NSLayoutConstraint(item: view, attribute: attribute, relatedBy: relation, toItem: secondView, attribute: attribute, multiplier: 1, constant: 0), priority: priority, handler: handler)
        }
        return self
    }
}

extension ViewFormation {
    public func centerX(secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        attribute(.CenterX, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
        return self
    }
    public func centerY(secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        attribute(.CenterY, relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
        return self
    }
    public func center(secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        attributes([NSLayoutAttribute.CenterX, NSLayoutAttribute.CenterY], relatedBy: .Equal, toView: secondView, priority: priority, handler: handler)
        return self
    }
}