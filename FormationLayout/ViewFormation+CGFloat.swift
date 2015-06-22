//
//  ViewFormation+CGFloat.swift
//  FormationLayout
//
//  Created by Evan on 22/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

// See helper extension methods in Formation+CGFloat.swift

/// ViewFormation extension that takes `CGFloat' constant to create constraints.
extension ViewFormation: FormationTakesCGFloat {
    
    /// `NSLayoutConstraint` factory method with `CGFloat' constant.
    public func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, constant: CGFloat, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {

        addConstraint(NSLayoutConstraint(item: view, attribute: attribute, relatedBy: relation, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: constant), priority: priority, handler: handler)
        
        return self
    }
}