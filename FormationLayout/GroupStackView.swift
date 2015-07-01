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
        guard !arrangedSubviews.contains(view) else { return }
        
        arrangedSubviews.append(view)
        setNeedsLayout()
    }
    public func insertArrangedSubview(view: UIView, atIndex stackIndex: Int) {
        guard !arrangedSubviews.contains(view) else { return }
        
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
            if spacing != oldValue {
                setNeedsLayout()
            }
        }
    }
    
    public var baselineRelativeArrangement: Bool = false {
        didSet {
            if baselineRelativeArrangement != oldValue {
                setNeedsLayout()
            }
        }
    }
    
    public var layoutMarginsRelativeArrangement: Bool = false {
        didSet {
            if layoutMarginsRelativeArrangement != oldValue {
                setNeedsLayout()
            }
        }
    }
    
    public var axis: UILayoutConstraintAxis = .Horizontal {
        didSet {
            if axis != oldValue {
                setNeedsLayout()
            }
        }
    }
    
    public var stackDistribution: StackViewDistribution = .Fill {
        didSet {
            if stackDistribution != oldValue {
                setNeedsLayout()
            }
        }
    }
    
    public var stackAlignment: StackViewAlignment = .Fill {
        didSet {
            if stackAlignment != oldValue {
                setNeedsLayout()
            }
        }
    }
    
    //----------------------------------
    // MARK: - Layout
    //----------------------------------
    struct LayoutState {
        var config: StackViewConfig
        var views: [UIView]
        
        var layout: FormationLayout
        var guides: [UIView]?
        
        func deactivate() {
            layout.deactivate()
            if let guides = guides {
                for guide in guides {
                    guide.removeFromSuperview()
                }
            }
        }
    }
    var activeState: LayoutState?
    public override func layoutSubviews() {
        defer { super.layoutSubviews() }
        
        let config = StackViewConfig(source: self)
        
        if let activeState = activeState {
            if activeState.config == config && activeState.views == arrangedSubviews {
                return
            } else {
                activeState.deactivate()
            }
        }
        
        // TODO Create new layout
    }
    
}