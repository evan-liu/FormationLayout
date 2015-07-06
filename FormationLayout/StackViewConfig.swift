//
//  StackViewConfig.swift
//  FormationLayout
//
//  Created by Evan on 1/07/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import Foundation

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
    
    public static var Top: StackViewAlignment {
        return .Leading
    }
    
    public static var Bottom: StackViewAlignment {
        return .Trailing
    }
}

public struct StackViewConfig: Equatable {
    /// The distance in points between the adjacent edges of the stack view’s arranged views.
    public var spacing: CGFloat = 0
    
    /// A Boolean value that determines whether the vertical spacing between views is measured from their baselines.
    public var baselineRelativeArrangement: Bool = false
    
    /// A Boolean value that determines whether the stack view lays out its arranged views relative to its layout margins.
    public var layoutMarginsRelativeArrangement: Bool = false

    /// The axis along which the arranged views are laid out.
    public var axis: UILayoutConstraintAxis = .Horizontal

    /// The distribution of the arranged views along the stack view’s axis.
    public var distribution: StackViewDistribution = .Fill

    /// The alignment of the arranged subviews perpendicular to the stack view’s axis.
    public var alignment: StackViewAlignment = .Fill
    
    public init(axis: UILayoutConstraintAxis = .Horizontal, distribution: StackViewDistribution = .Fill, alignment: StackViewAlignment = .Fill, spacing: CGFloat = 0, baselineRelativeArrangement: Bool = false, layoutMarginsRelativeArrangement: Bool = false) {
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
        self.baselineRelativeArrangement = baselineRelativeArrangement
        self.layoutMarginsRelativeArrangement = layoutMarginsRelativeArrangement
    }
}

public func ==(lhs: StackViewConfig, rhs: StackViewConfig) -> Bool {
    return lhs.spacing == rhs.spacing && lhs.baselineRelativeArrangement == rhs.baselineRelativeArrangement && lhs.layoutMarginsRelativeArrangement == rhs.layoutMarginsRelativeArrangement && lhs.axis == rhs.axis && lhs.distribution == rhs.distribution && lhs.alignment == rhs.alignment
}