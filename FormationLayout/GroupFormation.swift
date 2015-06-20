//
//  GroupFormation.swift
//  FormationLayout
//
//  Created by Evan on 20/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

/// Formation class to create and manager a group of constraints of one view.
public final class GroupFormation : Formation {
    public var installSizeClasses = Set<SizeClass>()
    public var exceptSizeClasses = Set<SizeClass>()
    public var active = false {
        didSet {
            for viewFormation in viewFormations {
                viewFormation.active = active
            }
        }
    }
    
    internal var viewFormations: [ViewFormation]
    init(views: [UIView]) {
        viewFormations = views.map { ViewFormation(view: $0) }
    }
    
}