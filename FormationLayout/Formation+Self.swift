//
//  Formation+Self.swift
//  FormationLayout
//
//  Created by Evan on 23/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

// See tests in ViewFormation+SelfTests.swift

/// Protocol for fomrations that create constraints to another attributes of itself.
///
/// Helper methods are all `relatedBy: .Equal`.
/// Use full defined `attribute()` method instead to have more control.
public protocol FormationToSelf {
    
    /// `NSLayoutConstraint` factory method to create a constraint to its another attribute.
    func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, toAttribute secondAttribute: NSLayoutAttribute, multiplier: CGFloat, constant: CGFloat, priority: UILayoutPriority, handler: ((NSLayoutConstraint) -> Void)?) -> Self
}

extension FormationToSelf {
    
    /// view.widthToHeight(by: 2, plus: 10) -> view.width = view.height * 2 + 10
    func widthToHeight(by multiplier: CGFloat = 1, plus constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Width, relatedBy: .Equal, toAttribute: .Height, multiplier: multiplier, constant: constant, priority: priority, handler: handler)
    }

    /// view.heightToWidth(by: 2, plus: 10) -> view.height = view.width * 2 + 10
    func heightToWidth(by multiplier: CGFloat = 1, plus constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> Self {
        
        return attribute(.Height, relatedBy: .Equal, toAttribute: .Width, multiplier: multiplier, constant: constant, priority: priority, handler: handler)
    }
}