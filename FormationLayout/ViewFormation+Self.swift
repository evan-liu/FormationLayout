//
//  ViewFormation+Self.swift
//  FormationLayout
//
//  Created by Evan on 23/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

/// Create constraints to another attributes of itself.
extension ViewFormation: FormationToSelf {
    
    /// `NSLayoutConstraint` factory method to create a constraint to its another attribute.
    public func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, toAttribute secondAttribute: NSLayoutAttribute, multiplier: CGFloat = 1, constant: CGFloat = 0, priority: UILayoutPriority, handler: ((NSLayoutConstraint) -> Void)?) -> Self {
        
        if secondAttribute != attribute {
            addConstraint(NSLayoutConstraint(item: view as! AnyObject, attribute: attribute, relatedBy: relation, toItem: (view as! AnyObject), attribute: secondAttribute, multiplier: multiplier, constant: constant), priority: priority, handler: handler)
        }
        
        return self
    }
}