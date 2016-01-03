//
//  ViewFormation+Container.swift
//  FormationLayout
//
//  Created by Evan on 3/01/16.
//  Copyright © 2016 evancoding.com. All rights reserved.
//

import UIKit

/// Create constraints by attributes of its container.
extension ViewFormation: FormationToContainer {
    
    /// `NSLayoutConstraint` factory method to create a constraint by an attribute of its container.
    public func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, toContainerAttribute secondAttribute: NSLayoutAttribute, multiplier: CGFloat = 1, constant: CGFloat = 0, priority: UILayoutPriority, handler: ((NSLayoutConstraint) -> Void)?) -> Self {
        
        guard let container = view.container else { return self }
        
        addConstraint(NSLayoutConstraint(item: view as! AnyObject, attribute: attribute, relatedBy: relation, toItem: (container as! AnyObject), attribute: secondAttribute, multiplier: multiplier, constant: constant), priority: priority, handler: handler)
        
        return self
    }
}
