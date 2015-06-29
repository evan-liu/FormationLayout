//
//  FormationLayout+Group.swift
//  FormationLayout
//
//  Created by Evan on 28/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import Foundation

extension FormationLayout {
    
    /// Factory method to create a 'GroupFormation' for multiple views.
    /// Views will be added to `rootView` if they have no `superView`.
    public func group(views: View...) -> GroupFormation {
        return group(container: rootView, views: views, moveView: false)
    }
    
    /// Factory method to create a 'GroupFormation' for multiple views.
    /// Views will be added to `rootView` if they have no `superView`.
    public func group(views: [View]) -> GroupFormation {
        return group(container: rootView, views: views, moveView: false)
    }
    
    /// Factory method to create a 'GroupFormation' for multiple views.
    /// Views will be added or moved to the container.
    public func group(container container: Container, views: View...) -> GroupFormation {
        return group(container: container, views: views, moveView: true)
    }
    
    /// Factory method to create a 'GroupFormation' for multiple views.
    ///
    /// - Parameter container: The container to add the views to if they have no `superView' yet.
    /// - Parameter views: Views to be added to the group.
    /// - Parameter moveView: If move a view to the container if it already has a `superView`.
    ///
    /// - Returns: A `GroupFormation` for the views.
    public func group(container container: Container, views: [View], moveView: Bool = false) -> GroupFormation {
        container.addToContainer(rootView, forceMove: false)
        
        for view in views {
            view.addToContainer(container, forceMove: moveView)
        }
        
        let formation = GroupFormation(views: views)
        formations.append(formation)
        
        return formation
    }
    
}