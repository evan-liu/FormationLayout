//
//  LayoutBlock.swift
//  FormationLayout
//
//  Created by Evan on 20/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

/// A block of formations that can install to size classes together.
public struct LayoutBlock {
    let formations: [Formation]
    init(formations: [Formation]) {
        self.formations = formations
    }
    
    public func install(sizeClass: SizeClass) -> LayoutBlock {
        for formation in formations {
            formation.install(sizeClass)
        }
        return self
    }
    
    public func except(sizeClass: SizeClass) -> LayoutBlock {
        for formation in formations {
            formation.except(sizeClass)
        }
        return self
    }
}

extension FormationLayout {
    /// Create a `LayoutBlock` to install a block of formations to size classes together.
    public func block(@noescape block: () -> Void) -> LayoutBlock {
        let startIndex = formations.count
        block()
        return LayoutBlock(formations: Array<Formation>(formations[startIndex ..< formations.count]))
    }
}