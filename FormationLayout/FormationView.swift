//
//  FormationView.swift
//  FormationLayout
//
//  Created by Evan on 18/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

public final class FormationView {
    public let layout: FormationLayout
    public let view: UIView
    private(set) public var constraints = [NSLayoutConstraint]()
    
    public init(layout: FormationLayout, view:UIView) {
        self.layout = layout
        self.view = view
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func attribute(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, target: LayoutTarget, priority: UILayoutPriority = UILayoutPriorityRequired, handler: ((NSLayoutConstraint) -> Void)? = nil) -> FormationView {
        let constraint = NSLayoutConstraint(item: view, attribute: attribute, relatedBy: relation, toItem: target.view, attribute: target.attribute, multiplier: target.multiplier, constant: target.constant)
        constraint.priority = priority
        if let handler = handler {
            handler(constraint)
        }
        constraints.append(constraint)
        return self
    }
    
}