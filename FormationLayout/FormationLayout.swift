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
    /// If activate added formations automaticly.
    internal let activateAddedFormations: Bool
    public init(rootView: Container, activateAddedFormations: Bool = true, prepareRootView: Bool = false) {
        self.rootView = rootView
        self.activateAddedFormations = activateAddedFormations
        
        if prepareRootView {
            rootView.prepareForLayout()
        }
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
    
    /// Deactivate all constraints.
    public func deactivate() {
        for formation in formations {
            formation.active = false
        }
    }
    
    internal func addFormation<T: Formation>(formation: T) -> T {
        if !formation.active && activateAddedFormations {
            formation.active = true
        }
        formations.append(formation)
        return formation
    }
}