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
    public let rootView: UIView
    public init(rootView: UIView) {
        self.rootView = rootView
        rootView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    /// Factory method to create a `ViewFormation` for one view.
    ///
    /// - Parameter view: The target view.
    /// - Parameter container: The container to add the view to. 
    ///     Will add the view to rootView if container is nil
    ///     and the view has no superview.
    ///
    /// - Returns: `ViewFormation` instance for the target view.
    public func view(view: UIView, container: UIView? = nil) -> ViewFormation {
        if let container = container where view.superview != container {
            container.addSubview(view)
        }
        if view.superview == nil {
            rootView.addSubview(view)
        }
        let formation = ViewFormation(view: view)
        formations.append(formation)
        return formation
    }
    
    /// Activate a size class by a `UIUserInterfaceSizeClass` pair.
    public func activate(hSizeClass: UIUserInterfaceSizeClass = .Unspecified, _ vSizeClass: UIUserInterfaceSizeClass = .Unspecified) {
        // Xcode will complain will activate new constraints before deactivate old ones. 
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