//
//  GroupFormation+Execute.swift
//  FormationLayout
//
//  Created by Evan on 22/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

/// Execute code block on the group and view formations.
extension GroupFormation {
    
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