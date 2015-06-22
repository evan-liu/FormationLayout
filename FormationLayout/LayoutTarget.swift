//
//  ViewAttribute.swift
//  FormationLayout
//
//  Created by Evan on 18/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

// MARK: - LayoutTarget

/// A struct holds secondItem, secondAttribute, multiplier and constant of a NSLayoutConstraint.
public struct LayoutTarget: Equatable {
    public let view: UIView
    public var attribute: NSLayoutAttribute
    
    public var multiplier: CGFloat = 1
    public var constant: CGFloat = 0
    
    public init(view: UIView, attribute: NSLayoutAttribute) {
        self.view = view
        self.attribute = attribute
    }
}

// MARK: - LayoutTarget Operators

public func == (lhs: LayoutTarget, rhs: LayoutTarget) -> Bool {
    return lhs.view == rhs.view && lhs.attribute == rhs.attribute && lhs.multiplier == rhs.multiplier && lhs.constant == rhs.constant
}

public func + (var lhs: LayoutTarget, rhs: CGFloat) -> LayoutTarget {
 
    lhs.constant += rhs
    
    return lhs
}

public func - (var lhs: LayoutTarget, rhs: CGFloat) -> LayoutTarget {
    
    lhs.constant -= rhs
    
    return lhs
}

public func * (var lhs: LayoutTarget, rhs: CGFloat) -> LayoutTarget {
    
    lhs.multiplier *= rhs
    
    return lhs
}

public func / (var lhs: LayoutTarget, rhs: CGFloat) -> LayoutTarget {
    
    lhs.multiplier /= rhs
    
    return lhs
}

// MARK: - UIView Operators

public func + (lhs: UIView, rhs: CGFloat) -> LayoutTarget {
    
    var target = LayoutTarget(view: lhs, attribute: .NotAnAttribute)
    target.constant = rhs
    
    return target
}

public func - (lhs: UIView, rhs: CGFloat) -> LayoutTarget {
    
    var target = LayoutTarget(view: lhs, attribute: .NotAnAttribute)
    target.constant = -rhs
    
    return target
}

public func * (lhs: UIView, rhs: CGFloat) -> LayoutTarget {
    
    var target = LayoutTarget(view: lhs, attribute: .NotAnAttribute)
    target.multiplier = rhs
    
    return target
}

public func / (lhs: UIView, rhs: CGFloat) -> LayoutTarget {
    
    var target = LayoutTarget(view: lhs, attribute: .NotAnAttribute)
    target.multiplier = 1 / rhs
    
    return target
}

// MARK: - UIView extension

extension UIView {
    public func layoutTarget(attribute: NSLayoutAttribute) -> LayoutTarget {
        return LayoutTarget(view: self, attribute: attribute)
    }
    
    public var left: LayoutTarget {
        return LayoutTarget(view: self, attribute: .Left)
    }
    
    public var right: LayoutTarget {
        return LayoutTarget(view: self, attribute: .Right)
    }
    
    public var top: LayoutTarget {
        return LayoutTarget(view: self, attribute: .Top)
    }
    
    public var bottom: LayoutTarget {
        return LayoutTarget(view: self, attribute: .Bottom)
    }
    
    public var leading: LayoutTarget {
        return LayoutTarget(view: self, attribute: .Leading)
    }
    
    public var trailing: LayoutTarget {
        return LayoutTarget(view: self, attribute: .Trailing)
    }
    
    public var width: LayoutTarget {
        return LayoutTarget(view: self, attribute: .Width)
    }
    
    public var height: LayoutTarget {
        return LayoutTarget(view: self, attribute: .Height)
    }
    
    public var centerX: LayoutTarget {
        return LayoutTarget(view: self, attribute: .CenterX)
    }
    
    public var centerY: LayoutTarget {
        return LayoutTarget(view: self, attribute: .CenterY)
    }
    
    public var baseline: LayoutTarget {
        return LayoutTarget(view: self, attribute: .Baseline)
    }
    
    public var firstBaseline: LayoutTarget {
        return LayoutTarget(view: self, attribute: .FirstBaseline)
    }
}