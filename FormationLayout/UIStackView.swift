//
//  UIStackView.swift
//  FormationLayout
//
//  Created by Evan on 30/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import Foundation

@available(iOS 9.0, *)
extension UIStackView: StackViewType {
    
    public var stackDistribution: StackViewDistribution {
        get {
            return StackViewDistribution.fromUIStackViewDistribution(distribution)
        }
        set {
            distribution = newValue.toUIStackViewDistribution()
        }
    }
    
    public var stackAlignment: StackViewAlignment {
        get {
            return StackViewAlignment.fromUIStackViewAlignment(alignment)
        }
        set {
            alignment = newValue.toUIStackViewAlignment()
        }
    }
}

@available(iOS 9.0, *)
extension StackViewDistribution {
    static func fromUIStackViewDistribution(distribution: UIStackViewDistribution) -> StackViewDistribution {
        switch distribution {
        case .Fill: return .Fill
        case .FillEqually: return .FillEqually
        case .FillProportionally: return .FillProportionally
        case .EqualSpacing: return .EqualSpacing
        case .EqualCentering: return .EqualCentering
        }
    }
    func toUIStackViewDistribution() -> UIStackViewDistribution {
        switch self {
        case .Fill: return .Fill
        case .FillEqually: return .FillEqually
        case .FillProportionally: return .FillProportionally
        case .EqualSpacing: return .EqualSpacing
        case .EqualCentering: return .EqualCentering
        }
    }
}

@available(iOS 9.0, *)
extension StackViewAlignment {
    static func fromUIStackViewAlignment(alignment: UIStackViewAlignment) -> StackViewAlignment {
        switch alignment {
        case .Fill: return .Fill
        case .Leading: return .Leading
        case .FirstBaseline: return .FirstBaseline
        case .Center: return .Center
        case .Trailing: return .Trailing
        case .LastBaseline: return .LastBaseline
        }
    }
    func toUIStackViewAlignment() -> UIStackViewAlignment {
        switch self {
        case .Fill: return .Fill
        case .Leading: return .Leading
        case .FirstBaseline: return .FirstBaseline
        case .Center: return .Center
        case .Trailing: return .Trailing
        case .LastBaseline: return .LastBaseline
        }
    }
}
