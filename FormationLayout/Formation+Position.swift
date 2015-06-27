//
//  Formation+Position.swift
//  FormationLayout
//
//  Created by Evan on 21/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import Foundation

/// Formation extension methods to create constraints by position to some other `View`
extension FormationTakesLayoutTarget {
    
    /// layout.view(v1).above(v2)
    /// - == layout.view(v1).bottom(v2.top)
    /// - == v1.Bottom = v2.Top
    public func above(secondView: View, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        let target = LayoutTarget(view: secondView, attribute: .Top)
        return attribute(.Bottom, relatedBy: .Equal, target:target, priority: priority, handler: handler)
    }
    /// layout.view(v1).below(v2)
    /// - == layout.view(v1).top(v2.bottom)
    /// - == v1.Top = v2.Bottom
    public func below(secondView: View, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        let target = LayoutTarget(view: secondView, attribute: .Bottom)
        return attribute(.Top, relatedBy: .Equal, target:target, priority: priority, handler: handler)
    }
    /// layout.view(v1).before(v2)
    /// - == layout.view(v1).trailing(v2.leading)
    /// - == v1.Trailing = v2.Leading
    public func before(secondView: View, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        let target = LayoutTarget(view: secondView, attribute: .Leading)
        return attribute(.Trailing, relatedBy: .Equal, target:target, priority: priority, handler: handler)
    }
    /// layout.view(v1).after(v2)
    /// - == layout.view(v1).leading(v2.trailing)
    /// - == v1.Leading = v2.Trailing
    public func after(secondView: View, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        let target = LayoutTarget(view: secondView, attribute: .Trailing)
        return attribute(.Leading, relatedBy: .Equal, target:target, priority: priority, handler: handler)
    }
}

extension FormationTakesLayoutTarget {
    /// layout.view(v1).above(v2 - 10)
    /// - == layout.view(v1).bottom(v2.top - 10)
    /// - == v1.Bottom = v2.Top - 10
    public func above(var target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        target.attribute = .Top
        return attribute(.Bottom, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    /// layout.view(v1).below(v2 + 10)
    /// - == layout.view(v1).top(v2.bottom + 10)
    /// - == v1.Top = v2.Bottom + 10
    public func below(var target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        target.attribute = .Bottom
        return attribute(.Top, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    /// layout.view(v1).before(v2 - 10)
    /// - == layout.view(v1).trailing(v2.leading - 10)
    /// - == v1.Trailing = v2.Leading - 10
    public func before(var target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        target.attribute = .Leading
        return attribute(.Trailing, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    /// layout.view(v1).after(v2 + 10)
    /// - == layout.view(v1).leading(v2.trailing + 10)
    /// - == v1.Leading = v2.Trailing + 10
    public func after(var target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        target.attribute = .Trailing
        return attribute(.Leading, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
}