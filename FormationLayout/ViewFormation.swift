//
//  ViewFormation.swift
//  FormationLayout
//
//  Created by Evan on 18/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

/// Formation class to create and manager a group of constraints of one view.
public final class ViewFormation: Formation {
    public var installSizeClasses = Set<SizeClass>()
    public var exceptSizeClasses = Set<SizeClass>()
    public var active = false {
        didSet {
            active ? NSLayoutConstraint.activateConstraints(constraints) : NSLayoutConstraint.deactivateConstraints(constraints)
        }
    }
    
    private(set) public var constraints = [NSLayoutConstraint]()
    
    /// Target view of the formation. Will be `firstItem` of all constraints.
    public let view: UIView
    public init(view:UIView) {
        self.view = view
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func addConstraint(constraint: NSLayoutConstraint, priority: UILayoutPriority, handler: ((NSLayoutConstraint) -> Void)?) -> Void {
        constraint.priority = priority
        if let handler = handler {
            handler(constraint)
        }
        constraints.append(constraint)
    }
}

extension ViewFormation: FormationTakesLayoutTarget {
    public func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        addConstraint(NSLayoutConstraint(item: view, attribute: attribute, relatedBy: relation, toItem: target.view, attribute: target.attribute, multiplier: target.multiplier, constant: target.constant), priority: priority, handler: handler)
        return self
    }
}

extension ViewFormation: FormationTakesCGFloat {
    public func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        addConstraint(NSLayoutConstraint(item: view, attribute: attribute, relatedBy: relation, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: constant), priority: priority, handler: handler)
        return self
    }
}

extension ViewFormation: FormationTakesUIView {
    public func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, toView secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        if secondView != view {
            addConstraint(NSLayoutConstraint(item: view, attribute: attribute, relatedBy: relation, toItem: secondView, attribute: attribute, multiplier: 1, constant: 0), priority: priority, handler: handler)
        }
        return self
    }
    
    public func attributes(attributes: [NSLayoutAttribute], relatedBy relation: NSLayoutRelation, toView secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        if secondView != view {
            for attribute in attributes {
                addConstraint(NSLayoutConstraint(item: view, attribute: attribute, relatedBy: relation, toItem: secondView, attribute: attribute, multiplier: 1, constant: 0), priority: priority, handler: handler)
            }
        }
        return self
    }
}