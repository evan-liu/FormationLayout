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
    
        attribute(.Left, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func leftEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Left, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func leftLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Left, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
    public func leftGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Left, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
}

extension FormationTakesLayoutTarget {
    public func right(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Right, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func rightEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Right, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func rightLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Right, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
    public func rightGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Right, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
}

extension FormationTakesLayoutTarget {
    public func top(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Top, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func topEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Top, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func topLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Top, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
    public func topGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Top, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
}

extension FormationTakesLayoutTarget {
    public func bottom(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Bottom, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func bottomEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Bottom, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func bottomLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Bottom, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
    public func bottomGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Bottom, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
}

extension FormationTakesLayoutTarget {
    public func leading(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Leading, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func leadingEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Leading, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func leadingLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Leading, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
    public func leadingGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Leading, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
}

extension FormationTakesLayoutTarget {
    public func trailing(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Trailing, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func trailingEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Trailing, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func trailingLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Trailing, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
    public func trailingGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Trailing, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
}

extension FormationTakesLayoutTarget {
    public func centerX(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.CenterX, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func centerXEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.CenterX, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func centerXLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.CenterX, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
    public func centerXGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.CenterX, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
}

extension FormationTakesLayoutTarget {
    public func centerY(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.CenterY, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func centerYEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.CenterY, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func centerYLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.CenterY, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
    public func centerYGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.CenterY, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
}

extension FormationTakesLayoutTarget {
    public func baseline(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Baseline, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func baselineEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Baseline, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func baselineLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Baseline, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
    public func baselineGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Baseline, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
}

extension FormationTakesLayoutTarget {
    public func firstBaseline(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.FirstBaseline, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func firstBaselineEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.FirstBaseline, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func firstBaselineLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.FirstBaseline, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
    public func firstBaselineGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.FirstBaseline, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
}

extension FormationTakesLayoutTarget {
    public func width(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Width, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func widthEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Width, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func widthLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Width, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
    public func widthGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Width, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
}

extension FormationTakesLayoutTarget {
    public func height(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Height, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func heightEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Height, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func heightLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Height, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
    public func heightGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        attribute(.Height, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
        return self
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