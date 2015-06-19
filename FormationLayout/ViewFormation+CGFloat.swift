//
//  ViewFormation+CGFloat.swift
//  FormationLayout
//
//  Created by Evan on 20/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

extension ViewFormation {
    /// `NSLayoutConstraint` factory method with `CGFloat' constant.
    public func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        addConstraint(NSLayoutConstraint(item: view, attribute: attribute, relatedBy: relation, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: constant), priority: priority, handler: handler)
        return self
    }
}

extension ViewFormation {
    public func width(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        attribute(.Width, relatedBy: .Equal, constant: constant, priority: priority, handler: handler)
        return self
    }
    public func widthEqual(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        attribute(.Width, relatedBy: .Equal, constant: constant, priority: priority, handler: handler)
        return self
    }
    public func widthLessThanOrEqual(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        attribute(.Width, relatedBy: .LessThanOrEqual, constant: constant, priority: priority, handler: handler)
        return self
    }
    public func widthGreaterThanOrEqual(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        attribute(.Width, relatedBy: .GreaterThanOrEqual, constant: constant, priority: priority, handler: handler)
        return self
    }
}

extension ViewFormation {
    public func height(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        attribute(.Height, relatedBy: .Equal, constant: constant, priority: priority, handler: handler)
        return self
    }
    public func heightEqual(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        attribute(.Height, relatedBy: .Equal, constant: constant, priority: priority, handler: handler)
        return self
    }
    public func heightLessThanOrEqual(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        attribute(.Height, relatedBy: .LessThanOrEqual, constant: constant, priority: priority, handler: handler)
        return self
    }
    public func heightGreaterThanOrEqual(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        attribute(.Height, relatedBy: .GreaterThanOrEqual, constant: constant, priority: priority, handler: handler)
        return self
    }
}