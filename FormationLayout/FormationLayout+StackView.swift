//
//  FormationLayout+StackView.swift
//  FormationLayout
//
//  Created by Evan on 1/07/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import Foundation

extension FormationLayout {
    
    /// Factory method to create a `StackViewFormation` for a `StackView`.
    /// `StackViewFormation` is used to manager configurations for subviews inside a `StackView` on size classes.
    /// Use `view()` method instead to create constraints to the `StackView` itself.
    ///
    /// - Parameter stack: The target `StackView`.
    /// - Parameter config: Configuration for the `StackView`.
    /// - Parameter arrangedSubviews: `arrangedSubviews` in the `StackView`.
    ///
    /// - Returns: `ViewFormation` instance for the target `StackView`.
    public func stack(stack: StackViewType, config: StackViewConfig, arrangedSubviews: [UIView]? = nil) -> StackViewFormation {
        return addFormation(StackViewFormation(stack: stack, config: config, arrangedSubviews: arrangedSubviews))
    }
}