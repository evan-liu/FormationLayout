//
//  GroupStackView.swift
//  FormationLayout
//
//  Created by Evan on 30/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import Foundation

final public class GroupStackView: UIView, StackViewType {
    //----------------------------------
    // MARK: - arrangedSubviews
    //----------------------------------
    internal(set) public var arrangedSubviews = [UIView]()
    public func addArrangedSubview(view: UIView) {
        guard arrangedSubviews.indexOf(view) == nil else { return }
        
        arrangedSubviews.append(view)
        setNeedsLayout()
    }
    public func insertArrangedSubview(view: UIView, atIndex stackIndex: Int) {
        guard arrangedSubviews.indexOf(view) == nil else { return }
        
        arrangedSubviews.insert(view, atIndex: stackIndex)
        setNeedsLayout()
    }
    public func removeArrangedSubview(view: UIView) {
        guard let index = arrangedSubviews.indexOf(view) else { return }
        
        arrangedSubviews.removeAtIndex(index)
        setNeedsLayout()
    }
    
    //----------------------------------
    // MARK: - Configuration
    //----------------------------------
    public var spacing: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    public var baselineRelativeArrangement: Bool = false {
        didSet {
            setNeedsLayout()
        }
    }
    
    public var layoutMarginsRelativeArrangement: Bool = false {
        didSet {
            setNeedsLayout()
        }
    }
    
    public var axis: UILayoutConstraintAxis = .Horizontal {
        didSet {
            setNeedsLayout()
        }
    }
    
    public var stackDistribution: StackViewDistribution = .Fill {
        didSet {
            setNeedsLayout()
        }
    }
    
    public var stackAlignment: StackViewAlignment = .Fill {
        didSet {
            setNeedsLayout()
        }
    }
    
}