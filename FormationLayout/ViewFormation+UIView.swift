//
//  ViewFormation+UIView.swift
//  FormationLayout
//
//  Created by Evan on 22/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

// See helper extension methods in Formation+UIView.swift

/// ViewFormation extension that takes another `UIView' to create constraints.
extension ViewFormation: FormationTakesUIView {
    
    /// `NSLayoutConstraint` factory method with another `UIView' to match an attribute.
    public func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, toView secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        if secondView != view {
            addConstraint(NSLayoutConstraint(item: view, attribute: attribute, relatedBy: relation, toItem: secondView, attribute: attribute, multiplier: 1, constant: 0), priority: priority, handler: handler)
        }
        
        return self
    }
    
    /// `NSLayoutConstraint` factory method with another `UIView' to match attributes.
    public func attributes(attributes: [NSLayoutAttribute], relatedBy relation: NSLayoutRelation, toView secondView: UIView, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        if secondView != view {
            for attribute in attributes {
                addConstraint(NSLayoutConstraint(item: view, attribute: attribute, relatedBy: relation, toItem: secondView, attribute: attribute, multiplier: 1, constant: 0), priority: priority, handler: handler)
            }
        }
        
        return self
    }
}

