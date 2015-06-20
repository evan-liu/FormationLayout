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

extension ViewFormation: FormationTakesUIView {
    public func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, toView secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        addConstraint(NSLayoutConstraint(item: view, attribute: attribute, relatedBy: relation, toItem: secondView, attribute: attribute, multiplier: 1, constant: 0), priority: priority, handler: handler)
        return self
    }
    
    public func attributes(attributes: [NSLayoutAttribute], relatedBy relation: NSLayoutRelation, toView secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        for attribute in attributes {
            addConstraint(NSLayoutConstraint(item: view, attribute: attribute, relatedBy: relation, toItem: secondView, attribute: attribute, multiplier: 1, constant: 0), priority: priority, handler: handler)
        }
        return self
    }
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