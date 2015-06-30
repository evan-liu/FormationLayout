//
//  StackView.swift
//  FormationLayout
//
//  Created by Evan on 30/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import Foundation

/// Protocol for `StackView` types. Will be `UIStackView` on iOS 9 and `UIView` + `GroupFormation` on iOS 8.
/// Port of `UIStackView` APIs except `stackDistribution` for `distribution` and `stackAlignment` for `alignment`. 
/// Because `UIStackViewDistribution` and `UIStackViewAlignment` are iOS 9 only.
public protocol StackViewType: class, StackViewConfigType {
    
    /// The list of views arranged by the stack view. (read-only)
    var arrangedSubviews: [UIView] { get }
    
    /// Adds a view to the end of the arrangedSubviews array.
    func addArrangedSubview(view: UIView)
    
    /// Removes the provided view from the stack’s array of arranged subviews.
    func removeArrangedSubview(view: UIView)
    
    /// Adds the provided view to the array of arranged subviews at the specified index.
    func insertArrangedSubview(view: UIView, atIndex stackIndex: Int)
    
}

extension StackViewType {
    
    /// Apply config values.
    public func applyConfig(config: StackViewConfigType) {
        spacing = config.spacing
        baselineRelativeArrangement = config.baselineRelativeArrangement
        layoutMarginsRelativeArrangement = config.layoutMarginsRelativeArrangement
        axis = config.axis
        stackDistribution = config.stackDistribution
        stackAlignment = config.stackAlignment
    }
    
}