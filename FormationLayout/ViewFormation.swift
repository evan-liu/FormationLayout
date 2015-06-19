//
//  ViewFormation.swift
//  FormationLayout
//
//  Created by Evan on 18/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

/// Formation layout helper class to create and manager a group of constraints of one view.
public final class ViewFormation {
    public let view: UIView
    private(set) public var constraints = [NSLayoutConstraint]()
    
    public var active = false {
        didSet {
            active ? NSLayoutConstraint.activateConstraints(constraints) : NSLayoutConstraint.deactivateConstraints(constraints)
        }
    }
    
    private var installSizeClasses = Set<SizeClass>()
    private var exceptSizeClasses = Set<SizeClass>()
    
    public init(view:UIView) {
        self.view = view
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    /// `NSLayoutConstraint` factory method with `LayoutTarget`.
    public func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        addConstraint(NSLayoutConstraint(item: view, attribute: attribute, relatedBy: relation, toItem: target.view, attribute: target.attribute, multiplier: target.multiplier, constant: target.constant), priority: priority, handler: handler)
        return self
    }
    
    /// `NSLayoutConstraint` factory method with `CGFloat' constant.
    public func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        addConstraint(NSLayoutConstraint(item: view, attribute: attribute, relatedBy: relation, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: constant), priority: priority, handler: handler)
        return self
    }
    
    /// Install to a size class. Constraints will only be active on installed size classes.
    /// If no size classes are installed wAny_hAny will be installed by default.
    public func install(sizeClass: SizeClass) -> ViewFormation {
        installSizeClasses.insert(sizeClass)
        return self
    }
    
    /// Constraints will not be active on the excepted size classes even if the size class is installed.
    public func except(sizeClass: SizeClass) -> ViewFormation {
        exceptSizeClasses.insert(sizeClass)
        return self
    }
    
    private func addConstraint(constraint: NSLayoutConstraint, priority: UILayoutPriority, handler: ((NSLayoutConstraint) -> Void)?) -> Void {
        constraint.priority = priority
        if let handler = handler {
            handler(constraint)
        }
        constraints.append(constraint)
    }
}

// MARK: - SizeClassHandler
extension ViewFormation : SizeClassHandler {
    func activate(hSizeClass: UIUserInterfaceSizeClass, _ vSizeClass: UIUserInterfaceSizeClass) {
        if activeForSizeClass(hSizeClass, vSizeClass) != active {
            active = !active
        }
    }
    
    func activeForSizeClass(hSizeClass: UIUserInterfaceSizeClass, _ vSizeClass: UIUserInterfaceSizeClass) -> Bool {
        for exceptSizeClass in exceptSizeClasses {
            if exceptSizeClass.match(hSizeClass, vSizeClass) {
                return false
            }
        }
        
        if installSizeClasses.count == 0 {
            return true 
        }
        
        for installSizeClass in installSizeClasses {
            if installSizeClass.match(hSizeClass, vSizeClass) {
                return true
            }
        }
        
        return false
    }
}

// MARK: - Attribute helper extensions to create constraints for attributes.
public extension ViewFormation {
    public func left(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Left, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func leftEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Left, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func leftLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Left, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
    public func leftGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Left, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
}

public extension ViewFormation {
    public func right(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Right, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func rightEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Right, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func rightLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Right, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
    public func rightGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Right, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
}

public extension ViewFormation {
    public func top(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Top, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func topEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Top, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func topLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Top, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
    public func topGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Top, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
}

public extension ViewFormation {
    public func bottom(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Bottom, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func bottomEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Bottom, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func bottomLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Bottom, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
    public func bottomGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Bottom, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
}

public extension ViewFormation {
    public func leading(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Leading, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func leadingEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Leading, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func leadingLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Leading, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
    public func leadingGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Leading, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
}

public extension ViewFormation {
    public func trailing(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Trailing, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func trailingEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Trailing, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func trailingLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Trailing, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
    public func trailingGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Trailing, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
}

public extension ViewFormation {
    public func centerX(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.CenterX, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func centerXEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.CenterX, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func centerXLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.CenterX, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
    public func centerXGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.CenterX, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
}

public extension ViewFormation {
    public func centerY(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.CenterY, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func centerYEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.CenterY, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func centerYLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.CenterY, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
    public func centerYGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.CenterY, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
}

public extension ViewFormation {
    public func baseline(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Baseline, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func baselineEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Baseline, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func baselineLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Baseline, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
    public func baselineGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Baseline, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
}

public extension ViewFormation {
    public func firstBaseline(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.FirstBaseline, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func firstBaselineEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.FirstBaseline, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func firstBaselineLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.FirstBaseline, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
    public func firstBaselineGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.FirstBaseline, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
}

public extension ViewFormation {
    public func width(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Width, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func widthEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Width, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func widthLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Width, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
    public func widthGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Width, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
}

public extension ViewFormation {
    public func height(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Height, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func heightEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Height, relatedBy: .Equal, target: target, priority: priority, handler: handler)
        return self
    }
    public func heightLessThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Height, relatedBy: .LessThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
    public func heightGreaterThanOrEqual(target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Height, relatedBy: .GreaterThanOrEqual, target: target, priority: priority, handler: handler)
        return self
    }
}

public extension ViewFormation {
    public func width(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Width, relatedBy: .Equal, constant: constant, priority: priority, handler: handler)
        return self
    }
    public func widthEqual(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Width, relatedBy: .Equal, constant: constant, priority: priority, handler: handler)
        return self
    }
    public func widthLessThanOrEqual(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Width, relatedBy: .LessThanOrEqual, constant: constant, priority: priority, handler: handler)
        return self
    }
    public func widthGreaterThanOrEqual(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Width, relatedBy: .GreaterThanOrEqual, constant: constant, priority: priority, handler: handler)
        return self
    }
}

public extension ViewFormation {
    public func height(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Height, relatedBy: .Equal, constant: constant, priority: priority, handler: handler)
        return self
    }
    public func heightEqual(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Height, relatedBy: .Equal, constant: constant, priority: priority, handler: handler)
        return self
    }
    public func heightLessThanOrEqual(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Height, relatedBy: .LessThanOrEqual, constant: constant, priority: priority, handler: handler)
        return self
    }
    public func heightGreaterThanOrEqual(constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> ViewFormation {
        self.attribute(.Height, relatedBy: .GreaterThanOrEqual, constant: constant, priority: priority, handler: handler)
        return self
    }
}