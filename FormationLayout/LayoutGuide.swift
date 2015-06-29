//
//  LayoutGuide.swift
//  FormationLayout
//
//  Created by Evan on 29/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import Foundation

/// Create a `LayoutGuide` as a `View`. Will create `UILayoutGuide` on iOS 9 and `UIView` on iOS 8.
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