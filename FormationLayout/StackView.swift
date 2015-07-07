//
//  StackView.swift
//  FormationLayout
//
//  Created by Evan on 30/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import Foundation

/// Create a `StackView`. Will create `UIStackView` on iOS 9 and `UIView` + `GroupFormation` on iOS 8.
public func StackView(arrangedSubviews views: [UIView] = [], config: StackViewConfig? = nil) -> StackViewType {
    let stack: StackViewType
    if #available(iOS 9.0, *) {
        stack = UIStackView(arrangedSubviews: views)
    } else {
        stack = GroupStackView(arrangedSubviews: views)
    }
    if let config = config {
        stack.applyConfig(config)
    }
    return stack
}

/// Protocol for `StackView` types. Will be `UIStackView` on iOS 9 and `UIView` + `GroupFormation` on iOS 8.
public protocol StackViewType: View {
    /// Change properties from a `StackViewConfig`.
    func applyConfig(config: StackViewConfig)
    
    /// Format properteis to a `StackViewConfig`.
    var currentConfig: StackViewConfig { get }
    
    /// The list of views arranged by the stack view. (read-only)
    var arrangedSubviews: [UIView] { get }
    
    /// Adds a view to the end of the arrangedSubviews array.
    func addArrangedSubview(view: UIView)
    
    /// Removes the provided view from the stack’s array of arranged subviews.
    func removeArrangedSubview(view: UIView)
    
    /// Adds the provided view to the array of arranged subviews at the specified index.
    func insertArrangedSubview(view: UIView, atIndex stackIndex: Int)
    
}