//
//  ViewFormation+LayoutTarget.swift
//  FormationLayout
//
//  Created by Evan on 22/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

// See helper extension methods in Formation+LayoutTarget.swift

/// ViewFormation extension that takes `LayoutTarget` to create constraints.
extension ViewFormation: FormationTakesLayoutTarget {
    
    /// `NSLayoutConstraint` factory method with `LayoutTarget`.
    public func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {

        let secondAttribute = target.attribute == .NotAnAttribute ? attribute : target.attribute
        if !target.view.isEqualTo(view) || secondAttribute != attribute {
            addConstraint(NSLayoutConstraint(item: view as! AnyObject, attribute: attribute, relatedBy: relation, toItem: (target.view as! AnyObject), attribute: secondAttribute, multiplier: target.multiplier, constant: target.constant), priority: priority, handler: handler)
        }
        
        return self
    }
}