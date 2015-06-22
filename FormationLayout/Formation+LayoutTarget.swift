//
//  ViewFormation+LayoutTarget.swift
//  FormationLayout
//
//  Created by Evan on 20/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

// See tests in ViewFormation+LayoutTargetTests.swift

/// Protocol for fomrations that take `LayoutTarget` to create constraints.
public protocol FormationTakesLayoutTarget {
    
    /// `NSLayoutConstraint` factory method with `LayoutTarget`.
    func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, target: LayoutTarget, priority: UILayoutPriority, handler: ((NSLayoutConstraint) -> Void)?) -> Self
}

extension FormationTakesLayoutTarget {
    public func left(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Left, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    public func leftEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Left, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    public func leftLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Left, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
    }
    public func leftGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Left, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
    }
}

extension FormationTakesLayoutTarget {
    public func right(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Right, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    public func rightEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Right, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    public func rightLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Right, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
    }
    public func rightGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Right, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
    }
}

extension FormationTakesLayoutTarget {
    public func top(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Top, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    public func topEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Top, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    public func topLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Top, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
    }
    public func topGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Top, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
    }
}

extension FormationTakesLayoutTarget {
    public func bottom(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Bottom, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    public func bottomEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Bottom, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    public func bottomLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Bottom, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
    }
    public func bottomGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Bottom, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
    }
}

extension FormationTakesLayoutTarget {
    public func leading(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Leading, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    public func leadingEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Leading, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    public func leadingLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Leading, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
    }
    public func leadingGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Leading, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
    }
}

extension FormationTakesLayoutTarget {
    public func trailing(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Trailing, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    public func trailingEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Trailing, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    public func trailingLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Trailing, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
    }
    public func trailingGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Trailing, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
    }
}

extension FormationTakesLayoutTarget {
    public func centerX(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.CenterX, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    public func centerXEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.CenterX, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    public func centerXLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.CenterX, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
    }
    public func centerXGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.CenterX, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
    }
}

extension FormationTakesLayoutTarget {
    public func centerY(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.CenterY, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    public func centerYEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.CenterY, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    public func centerYLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.CenterY, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
    }
    public func centerYGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.CenterY, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
    }
}

extension FormationTakesLayoutTarget {
    public func baseline(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Baseline, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    public func baselineEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Baseline, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    public func baselineLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Baseline, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
    }
    public func baselineGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Baseline, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
    }
}

extension FormationTakesLayoutTarget {
    public func firstBaseline(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.FirstBaseline, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    public func firstBaselineEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.FirstBaseline, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    public func firstBaselineLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.FirstBaseline, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
    }
    public func firstBaselineGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.FirstBaseline, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
    }
}

extension FormationTakesLayoutTarget {
    public func width(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Width, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    public func widthEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Width, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    public func widthLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Width, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
    }
    public func widthGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Width, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
    }
}

extension FormationTakesLayoutTarget {
    public func height(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Height, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    public func heightEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Height, relatedBy: .Equal, target: target, priority: priority, handler: handler)
    }
    public func heightLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Height, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
    }
    public func heightGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Height, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
    }
}

extension FormationTakesLayoutTarget {
    public func size(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Width, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        attribute(.Height, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func sizeEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Width, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        attribute(.Height, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func sizeLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Width, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
        attribute(.Height, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
    public func sizeGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Width, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
        attribute(.Height, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
}