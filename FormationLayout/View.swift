//
//  View.swift
//  FormationLayout
//
//  Created by Evan on 27/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import Foundation

/// Type protocol for views. A `View` can be an instance of `UIView` or `UILayoutGuide` (and `NSView` for OSX in the furture).
public protocol View {
    
    /// Prepare the View to work with the auto layout system. For `UIView` it is to set `translatesAutoresizingMaskIntoConstraints` to true .
    func prepareForLayout()
    
    /// Check if the view is equal to another.
    func isEqualTo(other: View) -> Bool
    
    /// Container of the view. `superView` for `UIView' and `owningView` for `UILayoutGuide`.
    var container: Container? { get }
    
    /// Add the view to a container. 
    /// - Parameter container: The container for the view. 
    /// - Parameter forceMove: If move the view to the new container if the view is already in a container.
    func addToContainer(container: Container, forceMove: Bool)
    
}