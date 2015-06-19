//
//  ViewFormation.swift
//  FormationLayout
//
//  Created by Evan on 18/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

/// Formation layout helper class to create and manager a group of constraints of one view.
public final class ViewFormation {
    public let view: UIView
    private(set) public var constraints = [NSLayoutConstraint]()
    
    public var active = false {
        didSet {
            active ? NSLayoutConstraint.activateConstraints(constraints) : NSLayoutConstraint.deactivateConstraints(constraints)
        }
    }
    
    public var installSizeClasses = Set<SizeClass>()
    public var exceptSizeClasses = Set<SizeClass>()
    
    public init(view:UIView) {
        self.view = view
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func addConstraint(constraint: NSLayoutConstraint, priority: UILayoutPriority, handler: ((NSLayoutConstraint) -> Void)?) -> Void {
        constraint.priority = priority
        if let handler = handler {
            handler(constraint)
        }
        constraints.append(constraint)
    }
}

// MARK: - Formation
extension ViewFormation : Formation {
    public func checkSizeClass(hSizeClass: UIUserInterfaceSizeClass, _ vSizeClass: UIUserInterfaceSizeClass) -> Bool {
        for exceptSizeClass in exceptSizeClasses {
            if exceptSizeClass.match(hSizeClass, vSizeClass) {
                return false
            }
        }
        
        if installSizeClasses.count == 0 {
            return true 
        }
        
        for installSizeClass in installSizeClasses {
            if installSizeClass.match(hSizeClass, vSizeClass) {
                return true
            }
        }
        
        return false
    }
}