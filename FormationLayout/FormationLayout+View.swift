//
//  FormationLayout+View.swift
//  FormationLayout
//
//  Created by Evan on 28/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import Foundation

extension FormationLayout {
    
    /// Factory method to create a `ViewFormation` for one view.
    ///
    /// - Parameter view: The target view.
    /// - Parameter container: The container to add the view to.
    ///     Will add the view to rootView if container is nil
    ///     and the view has no superview.
    ///
    /// - Returns: `ViewFormation` instance for the target view.
    public func view(view: View, container: Container? = nil) -> ViewFormation {
        if let container = container {
            container.addToContainer(rootView, forceMove: false)
            view.addToContainer(container, forceMove: true)
        }
        
        if view.container == nil {
            view.addToContainer(rootView, forceMove: false)
        }
        
        return addFormation(ViewFormation(view: view))
    }
    
}