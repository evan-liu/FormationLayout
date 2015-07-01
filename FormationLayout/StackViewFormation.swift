//
//  StackViewFormation.swift
//  FormationLayout
//
//  Created by Evan on 1/07/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import Foundation

/// Formation class to manager `StackView` configuration for size classes.
public final class StackViewFormation: Formation {
    public var installSizeClasses = Set<SizeClass>()
    public var exceptSizeClasses = Set<SizeClass>()
    public var active = false {
        didSet {
            view.applyConfig(config)
        }
    }
    
    private var view: StackViewType
    private var config: StackViewConfig
    
    public init(view: StackViewType, config: StackViewConfig) {
        self.view = view
        self.config = config
    }
}