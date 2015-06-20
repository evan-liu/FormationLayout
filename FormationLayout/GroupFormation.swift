//
//  GroupFormation.swift
//  FormationLayout
//
//  Created by Evan on 20/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

/// Formation class to create and manager a group of constraints of one view.
public final class GroupFormation: Formation {
    public var installSizeClasses = Set<SizeClass>()
    public var exceptSizeClasses = Set<SizeClass>()
    public var active = false {
        didSet {
            for viewFormation in viewFormations {
                viewFormation.active = active
            }
        }
    }
    
    internal var viewFormations: [ViewFormation]
    init(views: [UIView]) {
        viewFormations = views.map { ViewFormation(view: $0) }
    }
}

extension GroupFormation: FormationTakesLayoutTarget {
    public func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        for viewFormation in viewFormations {
            if viewFormation.view != target.view || attribute != target.attribute {
                viewFormation.attribute(attribute, relatedBy: relation, target: target, priority: priority, handler: handler)
            }
        }
        return self
    }
}

extension GroupFormation: FormationTakesCGFloat {
    public func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        for viewFormation in viewFormations {
            viewFormation.attribute(attribute, relatedBy: relation, constant: constant, priority: priority, handler: handler)
        }
        return self
    }
}

extension GroupFormation: FormationTakesUIView {
    public func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, toView secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        for viewFormation in viewFormations {
            if viewFormation.view != secondView {
                viewFormation.attribute(attribute, relatedBy: relation, toView: secondView, priority: priority, handler: handler)
            }
        }
        return self
    }
    
    public func attributes(attributes: [NSLayoutAttribute], relatedBy relation: NSLayoutRelation, toView secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        for viewFormation in viewFormations {
            if viewFormation.view != secondView {
                viewFormation.attributes(attributes, relatedBy: relation, toView: secondView, priority: priority, handler: handler)
            }
        }
        return self
    }
}