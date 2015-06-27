//
//  ViewFormation+View.swift
//  FormationLayout
//
//  Created by Evan on 22/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

// See helper extension methods in Formation+View.swift

/// ViewFormation extension that takes another `View' to create constraints.
extension ViewFormation: FormationTakesView {
    
    /// `NSLayoutConstraint` factory method with another `View' to match an attribute.
    public func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, toView secondView: View, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        guard !secondView.isEqualTo(view) else { return self }
        
        addConstraint(NSLayoutConstraint(item: view as! AnyObject, attribute: attribute, relatedBy: relation, toItem: (secondView as! AnyObject), attribute: attribute, multiplier: 1, constant: 0), priority: priority, handler: handler)
        
        return self
    }
    
    /// `NSLayoutConstraint` factory method with another `View' to match attributes.
    public func attributes(attributes: [NSLayoutAttribute], relatedBy relation: NSLayoutRelation, toView secondView: View, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        guard !secondView.isEqualTo(view) else { return self }
        
        for attribute in attributes {
            addConstraint(NSLayoutConstraint(item: view as! AnyObject, attribute: attribute, relatedBy: relation, toItem: (secondView as! AnyObject), attribute: attribute, multiplier: 1, constant: 0), priority: priority, handler: handler)
        }
        
        return self
    }
}

