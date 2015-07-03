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
    
    public static func Top() -> StackViewAlignment {
        return .Leading
    }
    
    public static func Bottom() -> StackViewAlignment {
        return .Trailing
    }
}

/// Protocol for `StackView` configurations.
public protocol StackViewConfigType {
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

public struct StackViewConfig: StackViewConfigType, Equatable {
    public var spacing: CGFloat = 0
    
    public var baselineRelativeArrangement: Bool = false
    
    public var layoutMarginsRelativeArrangement: Bool = false
    
    public var axis: UILayoutConstraintAxis = .Horizontal
    
    public var stackDistribution: StackViewDistribution = .Fill
    
    public var stackAlignment: StackViewAlignment = .Fill
}

public func ==(lhs: StackViewConfig, rhs: StackViewConfig) -> Bool {
    return lhs.spacing == rhs.spacing && lhs.baselineRelativeArrangement == rhs.baselineRelativeArrangement && lhs.layoutMarginsRelativeArrangement == rhs.layoutMarginsRelativeArrangement && lhs.axis == rhs.axis && lhs.stackDistribution == rhs.stackDistribution && lhs.stackAlignment == rhs.stackAlignment
}

extension StackViewConfig {
    public init(source: StackViewConfigType) {
        spacing = source.spacing
        baselineRelativeArrangement = source.baselineRelativeArrangement
        layoutMarginsRelativeArrangement = source.layoutMarginsRelativeArrangement
        axis = source.axis
        stackDistribution = source.stackDistribution
        stackAlignment = source.stackAlignment
    }
}