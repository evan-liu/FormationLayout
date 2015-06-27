//
//  FormationLayout.swift
//  FormationLayout
//
//  Created by Evan on 18/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

/// Top level layout class for one root view.
public final class FormationLayout {
    internal var formations = [Formation]()
    
    /// Root view of the layout. Default container of added views.
    public let rootView: Container
    public init(rootView: Container) {
        self.rootView = rootView
        rootView.prepareForLayout()
    }
    
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
            view.addToContainer(container, forceMove: true)
        }
        
        if view.container == nil {
            view.addToContainer(rootView, forceMove: false)
        }
        
        let formation = ViewFormation(view: view)
        formations.append(formation)
        
        return formation
    }
    
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

        for view in views {
            view.addToContainer(container, forceMove: moveView)
        }
        
        let formation = GroupFormation(views: views)
        formations.append(formation)
        
        return formation
    }
    
    
    /// Activate a size class by a `UIUserInterfaceSizeClass` pair.
    public func activate(hSizeClass: UIUserInterfaceSizeClass = .Unspecified, _ vSizeClass: UIUserInterfaceSizeClass = .Unspecified) {

        // Xcode will complain if activate new constraints before deactivate old ones.
        // So make sure deactivate old constraints first.
        var formationsToActivate = [Formation]()
        var formationsToDeactivate = [Formation]()
        for formation in formations {
            if formation.checkSizeClass(hSizeClass, vSizeClass) != formation.active {
                if formation.active {
                    formationsToDeactivate.append(formation)
                } else {
                    formationsToActivate.append(formation)
                }
            }
        }
        
        for formationToDeactivate in formationsToDeactivate {
            formationToDeactivate.active = false
        }
        
        for formationToActivate in formationsToActivate {
            formationToActivate.active = true
        }
    }
    
    /// Activate a size class by a `UITraitCollection`.
    public func activate(traitCollection: UITraitCollection) {
        activate(traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass)
    }
}