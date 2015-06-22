//
//  GroupFormation+UIView.swift
//  FormationLayout
//
//  Created by Evan on 22/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

/// GroupFormation extension that takes another `UIView' to create constraints.
extension GroupFormation: FormationTakesUIView {
    
    /// `NSLayoutConstraint` factory method with another `UIView' to match an attribute.    
    public func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, toView secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        for viewFormation in viewFormations {
            if viewFormation.view != secondView {
                viewFormation.attribute(attribute, relatedBy: relation, toView: secondView, priority: priority, handler: handler)
            }
        }
        return self
    }
    
    /// `NSLayoutConstraint` factory method with another `UIView' to match attributes.    
    public func attributes(attributes: [NSLayoutAttribute], relatedBy relation: NSLayoutRelation, toView secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        for viewFormation in viewFormations {
            if viewFormation.view != secondView {
                viewFormation.attributes(attributes, relatedBy: relation, toView: secondView, priority: priority, handler: handler)
            }
        }
        return self
    }
}