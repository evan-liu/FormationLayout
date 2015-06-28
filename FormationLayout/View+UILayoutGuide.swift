//
//  View+UILayoutGuide.swift
//  FormationLayout
//
//  Created by Evan on 29/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import Foundation

/// Create a `LayoutGuide` as a `View`. Will create `UILayoutGuide` in iOS 9 and `UIView` in iOS 8.
/// - Parameter container: The container `UIView` to add the `LayoutGuide` to.
/// - Returns: A `View` that can work with `view()` or `group()` methods of `FormationLayout`.
public func LayoutGuide(container container: UIView? = nil) -> View {
    let guide: View
    
    if #available(iOS 9.0, *) {
        guide = UILayoutGuide()
    } else {
        guide = UIView()
    }
    
    if let container = container {
        guide.addToContainer(container, forceMove: true)
    }
    
    return guide
}

@available(iOS 9.0, *)
extension UILayoutGuide: View {
    public func prepareForLayout() {
    }
    
    public func isEqualTo(other: View) -> Bool {
        guard let other = other as? UILayoutGuide else { return false }
        return other == self
    }
    
    public var container: Container? {
        return owningView
    }
    
    public func addToContainer(container: Container, forceMove: Bool = false) {
        guard let container = container as? UIView where container != owningView else { return }
        if owningView == nil || forceMove {
            container.addLayoutGuide(self)
        }
    }
}