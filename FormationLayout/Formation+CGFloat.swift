//
//  ViewFormation+CGFloat.swift
//  FormationLayout
//
//  Created by Evan on 20/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

// See tests in ViewFormation+CGFloatTests.swift

/// Protocol for fomrations that take `CGFloat` constant to create constraints.
public protocol FormationTakesCGFloat {
    
    /// `NSLayoutConstraint` factory method with `CGFloat' constant.
    func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, constant: CGFloat, priority: UILayoutPriority, handler: ((NSLayoutConstraint) -> Void)?) -> Self
}

extension FormationTakesCGFloat {
    public func width(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Width, relatedBy: .Equal, constant: constant, priority: priority, handler: handler)
    }
    public func widthEqual(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Width, relatedBy: .Equal, constant: constant, priority: priority, handler: handler)
    }
    public func widthLessThanOrEqual(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Width, relatedBy: .LessThanOrEqual, constant: constant, priority: priority, handler: handler)
    }
    public func widthGreaterThanOrEqual(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Width, relatedBy: .GreaterThanOrEqual, constant: constant, priority: priority, handler: handler)
    }
}

extension FormationTakesCGFloat {
    public func height(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Height, relatedBy: .Equal, constant: constant, priority: priority, handler: handler)
    }
    public func heightEqual(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Height, relatedBy: .Equal, constant: constant, priority: priority, handler: handler)
    }
    public func heightLessThanOrEqual(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Height, relatedBy: .LessThanOrEqual, constant: constant, priority: priority, handler: handler)
    }
    public func heightGreaterThanOrEqual(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Height, relatedBy: .GreaterThanOrEqual, constant: constant, priority: priority, handler: handler)
    }
}

extension FormationTakesCGFloat {
    public func size(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Width, relatedBy: .Equal, constant: constant, priority: priority, handler: handler)
        attribute(.Height, relatedBy: .Equal, constant: constant, priority: priority, handler: handler)
        return self
    }
    public func sizeEqual(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Width, relatedBy: .Equal, constant: constant, priority: priority, handler: handler)
        attribute(.Height, relatedBy: .Equal, constant: constant, priority: priority, handler: handler)
        return self
    }
    public func sizeLessThanOrEqual(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Width, relatedBy: .LessThanOrEqual, constant: constant, priority: priority, handler: handler)
        attribute(.Height, relatedBy: .LessThanOrEqual, constant: constant, priority: priority, handler: handler)
        return self
    }
    public func sizeGreaterThanOrEqual(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Width, relatedBy: .GreaterThanOrEqual, constant: constant, priority: priority, handler: handler)
        attribute(.Height, relatedBy: .GreaterThanOrEqual, constant: constant, priority: priority, handler: handler)
        return self
    }
}