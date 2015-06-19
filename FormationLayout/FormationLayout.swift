//
//  FormationLayout.swift
//  FormationLayout
//
//  Created by Evan on 18/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

/// Protocal for sizeClass handlers which respond to sizeClass changes.
internal protocol SizeClassHandler {
    func activate(hSizeClass: UIUserInterfaceSizeClass, _ vSizeClass: UIUserInterfaceSizeClass)
}

/// Top level layout class for one root view.
public final class FormationLayout {
    public let rootView: UIView
    private var formations = [SizeClassHandler]()
    
    public init(rootView: UIView) {
        self.rootView = rootView
        rootView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    /// Factory method to create a `ViewFormation` for one view.
    /// - Parameter view: The target view.
    /// - Parameter container: The container to add the view to. 
    ///     Will add the view to rootView if container is nil
    ///     and the view has no superview.
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
    
    /// Activate a size class.
    public func activate(hSizeClass: UIUserInterfaceSizeClass = .Unspecified, _ vSizeClass: UIUserInterfaceSizeClass = .Unspecified) {
        for formation in formations {
            formation.activate(hSizeClass, vSizeClass)
        }
    }
}