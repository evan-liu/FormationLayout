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
public protocol StackViewType {
    
    /// The list of views arranged by the stack view. (read-only)
    var arrangedSubviews: [UIView] { get }
    
    /// Adds a view to the end of the arrangedSubviews array.
    func addArrangedSubview(view: UIView)
    
    /// Removes the provided view from the stack’s array of arranged subviews.
    func removeArrangedSubview(view: UIView)
    
    /// Adds the provided view to the array of arranged subviews at the specified index.
    func insertArrangedSubview(view: UIView, atIndex stackIndex: Int)
    
    /// The distance in points between the adjacent edges of the stack view’s arranged views.
    var spacing: CGFloat { get set }
    
    /// A Boolean value that determines whether the vertical spacing between views is measured from their baselines.
    var baselineRelativeArrangement: Bool { get set }
    
    /// A Boolean value that determines whether the stack view lays out its arranged views relative to its layout margins.
    var layoutMarginsRelativeArrangement: Bool { get set }
    
    /// The axis along which the arranged views are laid out.
    var axis: UILayoutConstraintAxis { get set }
    
    /// The distribution of the arranged views along the stack view’s axis.
    var stackDistribution: StackViewDistribution { get set }
    
    /// The alignment of the arranged subviews perpendicular to the stack view’s axis.
    var stackAlignment: StackViewAlignment { get set }
    
}

/// Port of `UIStackViewDistribution` for iOS 8
public enum StackViewDistribution : Int {
    case Fill
    case FillEqually
    case FillProportionally
    case EqualSpacing
    case EqualCentering
}

/// Port of `UIStackViewAlignment` for iOS 8
public enum StackViewAlignment : Int {
    case Fill
    case Center
    case Leading
    case Trailing
    case FirstBaseline
    case LastBaseline
}