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
    public let rootView: UIView
    
    public init(rootView: UIView) {
        self.rootView = rootView
        rootView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    /// Factory method to create a `FormationView` for one view.
    /// - Parameter view: The target view.
    /// - Parameter container: The container to add the view to. 
    ///     Will add the view to rootView if container is nil
    ///     and the view has no superview.
    /// - Returns: `FormationView` instance for the target view.
    public func view(view: UIView, container: UIView? = nil) -> FormationView {
        if let container = container where view.superview != container {
            container.addSubview(view)
        }
        if view.superview == nil {
            rootView.addSubview(view)
        }
        return FormationView(layout: self, view: view)
    }
}