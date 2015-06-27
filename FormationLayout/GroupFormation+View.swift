//
//  GroupFormation+View.swift
//  FormationLayout
//
//  Created by Evan on 22/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

// See helper extension methods in Formation+View.swift

/// GroupFormation extension that takes another `View' to create constraints.
extension GroupFormation: FormationTakesView {
    
    /// `NSLayoutConstraint` factory method with another `View' to match an attribute.    
    public func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, toView secondView: View, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {

        for viewFormation in viewFormations {
            if !viewFormation.view.isEqualTo(secondView) {
                viewFormation.attribute(attribute, relatedBy: relation, toView: secondView, priority: priority, handler: handler)
            }
        }
        
        return self
    }
    
    /// `NSLayoutConstraint` factory method with another `View' to match attributes.    
    public func attributes(attributes: [NSLayoutAttribute], relatedBy relation: NSLayoutRelation, toView secondView: View, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        for viewFormation in viewFormations {
            if !viewFormation.view.isEqualTo(secondView) {
                viewFormation.attributes(attributes, relatedBy: relation, toView: secondView, priority: priority, handler: handler)
            }
        }
        
        return self
    }
}