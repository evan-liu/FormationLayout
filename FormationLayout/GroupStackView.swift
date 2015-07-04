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
    private struct LayoutState {
        var config: StackViewConfig
        var views: [UIView]
        
        var layout: FormationLayout
        var viewGroup: GroupFormation
        
        var guides: [UIView]?
        var guideGroup: GroupFormation?
        
        init(stack: GroupStackView, config: StackViewConfig) {
            self.config = config
            views = stack.arrangedSubviews
            layout = FormationLayout(rootView: stack)
            viewGroup = layout.group(stack.arrangedSubviews)
            
            // Need guides for .EqualSpacing/.EqualCentering if there are more than 1 views
            if views.count > 2 && (config.stackDistribution == .EqualSpacing || config.stackDistribution == .EqualCentering) {
                guides = [UIView]()
                for _ in 0 ..< views.count - 1 {
                    guides!.append(UIView.dummyView())
                }
                guideGroup = layout.group(guides!)
            }
        }
        
        func deactivate() {
            layout.deactivate()
            if let guides = guides {
                for guide in guides {
                    guide.removeFromSuperview()
                }
            }
        }
    }
    private var activeState: LayoutState?
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
        
        activeState = LayoutState(stack: self, config: config)
        
        // Pin the first and last view to the stack view.
        activeState!.viewGroup
            .first { pinView($0, to: config.pinLeading) }
            .last { pinView($0, to: config.pinTrailing) }

        // Distribution
        switch config.stackDistribution {
        case .Fill:
            distributeFill(state: activeState!, config: config)
        case .FillEqually:
            distributeFillEqually(state: activeState!, config: config)
        case .FillProportionally:
            distributeFillProportionally(state: activeState!, config: config)
        case .EqualCentering, .EqualSpacing:
            distributeGuides(state: activeState!, config: config)
            forceViewSpaceing(state: activeState!, config: config)
        }
        
        // Activate constraints
        activeState!.layout.activate()
    }
    
    //----------------------------------
    // MARK: Distribution
    //----------------------------------
    private func distributeFill(state state: LayoutState, config: StackViewConfig) {
        if config.axis == .Vertical {
            state.viewGroup.vSpace(config.spacing)
        } else {
            state.viewGroup.hSpace(config.spacing)
        }
    }
    private func distributeFillEqually(state state: LayoutState, config: StackViewConfig) {
        if config.axis == .Vertical {
            state.viewGroup.vSpace(config.spacing).sameHeight()
        } else {
            state.viewGroup.hSpace(config.spacing).sameWidth()
        }
    }
    private func distributeFillProportionally(state state: LayoutState, config: StackViewConfig) {
        if config.axis == .Vertical {
            let totalHeight = arrangedSubviews.reduce(0, combine: { (height, view) -> CGFloat in
                return height + view.intrinsicContentSize().height
            }) + config.spacing * CGFloat(arrangedSubviews.count - 1)
            state.viewGroup.vSpace(config.spacing).forEach { viewFormation, index, group in
                let view = viewFormation.view as! UIView
                let viewHeight = view.intrinsicContentSize().height
                if viewHeight > 0 {
                    viewFormation.height(self * (viewHeight / totalHeight))
                }
            }
        } else {
            let totalWidth = arrangedSubviews.reduce(0, combine: { (width, view) -> CGFloat in
                return width + view.intrinsicContentSize().width
            }) + config.spacing * CGFloat(arrangedSubviews.count - 1)
            state.viewGroup.hSpace(config.spacing).forEach { viewFormation, index, group in
                let view = viewFormation.view as! UIView
                let viewWidth = view.intrinsicContentSize().width
                if viewWidth > 0 {
                    viewFormation.width(self * (viewWidth / totalWidth))
                }
            }
        }
    }
    private func distributeGuides(state state: LayoutState, config: StackViewConfig) {
        
        guard let guideGroup = state.guideGroup else { return }
        
        if config.axis == .Vertical {
            guideGroup.sameHeight()
        } else {
            guideGroup.sameWidth()
        }
        
        for i in 0 ..< guideGroup.count {
            guideGroup.at(i) {
                let leadingTarget = LayoutTarget(view: state.viewGroup.viewAt(i), attribute: config.viewAttributeForGuideLeading)
                $0.attribute(config.distributeLeading, relatedBy: .Equal, target: leadingTarget)
                
                let trailingTarget = LayoutTarget(view: state.viewGroup.viewAt(i + 1), attribute: config.viewAttributeForGuideTrailing)
                $0.attribute(config.distributeTrailing, relatedBy: .Equal, target: trailingTarget)
            }
        }
        
    }
    private func forceViewSpaceing(state state: LayoutState, config: StackViewConfig) {
        let viewGroup = state.viewGroup
        for i in 1 ..< viewGroup.count {
            var previousViewTarget = LayoutTarget(view: viewGroup.viewAt(i - 1), attribute: config.distributeTrailing)
            previousViewTarget.constant = config.spacing
            viewGroup[i].attribute(config.distributeLeading, relatedBy: .GreaterThanOrEqual, target: previousViewTarget)
        }
    }
    
    //----------------------------------
    // MARK: Helper methods
    //----------------------------------
    private func pinView(view: ViewFormation, to attribute: NSLayoutAttribute) {
        view.attribute(attribute, relatedBy: .Equal, toView: self)
    }
}

private extension StackViewConfig {
    /// View leading attribute perpendicular to the stack view’s axis.
    var alignLeading: NSLayoutAttribute {
        return axis == .Vertical ? .Leading : .Top
    }
    /// View trailing attribute perpendicular to the stack view’s axis.
    var alignTrailing: NSLayoutAttribute {
        return axis == .Vertical ? .Trailing : .Bottom
    }
    /// First view leading attribute to pin the view to stack view.
    var pinLeading: NSLayoutAttribute {
        return axis == .Vertical ? .Top : .Leading
    }
    /// Last view trailing attribute to pin the view to stack view.
    var pinTrailing: NSLayoutAttribute {
        return axis == .Vertical ? .Bottom : .Trailing
    }
    /// View leading attribute along the stack view’s axis.
    var distributeLeading: NSLayoutAttribute {
        if axis == .Vertical {
            return baselineRelativeArrangement ? .FirstBaseline : .Top
        }
        return .Leading
    }
    /// View trailing attribute along the stack view’s axis.
    var distributeTrailing: NSLayoutAttribute {
        if axis == .Vertical {
            return baselineRelativeArrangement ? .Baseline : .Bottom
        }
        return .Trailing
    }
    /// View attribute for leading of layout guides between views.
    var viewAttributeForGuideLeading: NSLayoutAttribute {
        if stackDistribution == .EqualCentering {
            return axis == .Vertical ? .CenterY : .CenterX
        }
        return distributeTrailing
    }
    /// View attribute for trailing of layout guides between views.
    var viewAttributeForGuideTrailing: NSLayoutAttribute {
        if stackDistribution == .EqualCentering {
            return axis == .Vertical ? .CenterY : .CenterX
        }
        return distributeLeading
    }
}