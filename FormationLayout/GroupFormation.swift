//
//  GroupFormation.swift
//  FormationLayout
//
//  Created by Evan on 20/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

/// Formation class to create and manager a group of constraints of one view.
public final class GroupFormation: Formation {
    public var installSizeClasses = Set<SizeClass>()
    public var exceptSizeClasses = Set<SizeClass>()
    public var active = false {
        didSet {
            for viewFormation in viewFormations {
                viewFormation.active = active
            }
        }
    }
    
    internal var viewFormations: [ViewFormation]
    init(views: [UIView]) {
        guard views.count > 1 else { fatalError("Group Formation need more than one view") }
        viewFormations = views.map { ViewFormation(view: $0) }
    }
    
    /// Get the `ViewFormation` at index.
    public subscript(index:Int) -> ViewFormation {
        return viewFormations[index]
    }
    
    // MARK: Helper properties
    
    /// Count of the views in the group.
    public var count: Int {
        return viewFormations.count
    }
    
    /// The first `UIView` in the group
    public var firstView: UIView {
        return viewFormations.first!.view
    }
    
    /// The last `UIView` in the group
    public var lastView: UIView {
        return viewFormations.last!.view
    }
    
    /// Get view at index
    public func viewAt(index: Int) -> UIView {
        return viewFormations[index].view
    }
    
    // MARK: Code block runners
    
    /// Execute a code block with the `GroupFormation` passed in.
    public func execute(@noescape block: (GroupFormation) -> Void) -> Self {
        block(self)
        return self
    }
    
    /// Execute a code block with the first `ViewFormation` in the group.
    public func first(@noescape block: (ViewFormation) -> Void) -> Self {
        block(viewFormations.first!)
        return self
    }

    /// Execute a code block with the last `ViewFormation` in the group.
    public func last(@noescape block: (ViewFormation) -> Void) -> Self {
        block(viewFormations.last!)
        return self
    }
    
    /// Execute a code block with the `GroupFormation` at an index.
    public func at(index: Int, @noescape block: (ViewFormation) -> Void) -> Self {
        block(viewFormations[index])
        return self
    }
    
    /// Execute a code block for each `ViewFormation` in the group.
    ///
    /// The block takes three arguments:
    ///   - current: The current `ViewFormation` being processed in the group.
    ///   - index: The index of the current `ViewFormation` being processed in the group.
    ///   - group: The `GroupFormation` itself.
    public func forEach(@noescape block: (ViewFormation, Int, GroupFormation) -> Void) -> Self {
        for i in 0 ..< viewFormations.count {
            block(viewFormations[i], i, self)
        }
        return self
    }
    
    /// Execute a code block for each `ViewFormation` in the group.
    ///
    /// The block takes three arguments:
    ///   - current: The current `ViewFormation` being processed in the group.
    ///   - index: The index of the current `ViewFormation` being processed in the group.
    ///   - group: The `GroupFormation` itself.
    public func forEachReverse(@noescape block: (ViewFormation, Int, GroupFormation) -> Void) -> Self {
        for var i = viewFormations.count - 1; i >= 0; i-- {
            block(viewFormations[i], i, self)
        }
        return self
    }
}

