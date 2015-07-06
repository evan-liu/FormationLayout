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
            if active {
                applyArrangedSubviews()
                stack.applyConfig(config)
            }
        }
    }
    
    private var stack: StackViewType
    private var config: StackViewConfig
    private var arrangedSubviews: [UIView]?
    
    public init(stack: StackViewType, config: StackViewConfig, arrangedSubviews: [UIView]? = nil) {
        self.stack = stack
        self.config = config
        self.arrangedSubviews = arrangedSubviews
    }
    
    private func applyArrangedSubviews() {
        guard let arrangedSubviews = arrangedSubviews else { return }
        
        for oldView in stack.arrangedSubviews {
            stack.removeArrangedSubview(oldView)
        }
        
        for newView in arrangedSubviews {
            stack.addArrangedSubview(newView)
        }
    }
}