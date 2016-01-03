//
//  Formation+Container.swift
//  FormationLayout
//
//  Created by Evan on 3/01/16.
//  Copyright © 2016 evancoding.com. All rights reserved.
//

import UIKit

// See tests in ViewFormation+ContainerTests.swift

/// Protocol for fomrations that create constraints by attributes of its container.
///
/// Helper methods are all `relatedBy: .Equal`.
/// Use full defined `attribute()` method instead to have more control.
public protocol FormationToContainer {
    
    /// `NSLayoutConstraint` factory method to create a constraint by an attribute of its container.
    func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, toContainerAttribute secondAttribute: NSLayoutAttribute, multiplier: CGFloat, constant: CGFloat, priority: UILayoutPriority, handler: ((NSLayoutConstraint) -> Void)?) -> Self
}

extension FormationToContainer {
    public func pinTop(padding constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Top, relatedBy: .Equal, toContainerAttribute: .Top, multiplier: 1, constant: constant, priority: priority, handler: handler)
    }
    public func pinBottom(padding constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Bottom, relatedBy: .Equal, toContainerAttribute: .Bottom, multiplier: 1, constant: -constant, priority: priority, handler: handler)
    }

    public func pinLeft(padding constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Left, relatedBy: .Equal, toContainerAttribute: .Left, multiplier: 1, constant: constant, priority: priority, handler: handler)
    }
    public func pinRight(padding constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Right, relatedBy: .Equal, toContainerAttribute: .Right, multiplier: 1, constant: -constant, priority: priority, handler: handler)
    }
    
    public func pinLeading(padding constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Leading, relatedBy: .Equal, toContainerAttribute: .Leading, multiplier: 1, constant: constant, priority: priority, handler: handler)
    }
    public func pinTrailing(padding constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Trailing, relatedBy: .Equal, toContainerAttribute: .Trailing, multiplier: 1, constant: -constant, priority: priority, handler: handler)
    }
    
    public func pinCenterX(offset constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.CenterX, relatedBy: .Equal, toContainerAttribute: .CenterX, multiplier: 1, constant: constant, priority: priority, handler: handler)
    }
    public func pinCenterY(offset constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.CenterY, relatedBy: .Equal, toContainerAttribute: .CenterY, multiplier: 1, constant: constant, priority: priority, handler: handler)
    }
    public func pinCenter(offset offset: (x: CGFloat, y: CGFloat) = (0, 0), priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        pinCenterX(offset: offset.x, priority: priority, handler: handler)
        pinCenterY(offset: offset.y, priority: priority, handler: handler)
        return self
    }
    
    public func fillWidth(padding constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        pinLeading(padding: constant, priority: priority, handler: handler)
        pinTrailing(padding: constant, priority: priority, handler: handler)
        return self
    }
    public func fillHeight(padding constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        pinTop(padding: constant, priority: priority, handler: handler)
        pinBottom(padding: constant, priority: priority, handler: handler)
        return self
    }
    public func fill(padding constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        pinLeading(padding: constant, priority: priority, handler: handler)
        pinTrailing(padding: constant, priority: priority, handler: handler)
        pinTop(padding: constant, priority: priority, handler: handler)
        pinBottom(padding: constant, priority: priority, handler: handler)
        return self
    }
    
}