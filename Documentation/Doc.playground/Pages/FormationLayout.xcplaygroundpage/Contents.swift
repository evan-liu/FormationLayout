//: [Home](Home) | [Previous](@previous) | [Next](@next)

import UIKit
import FormationLayout

/*:
 ## FormationLayout
 ----
 
 `FormationLayout` is the top level layout class for one root view.
 
 - `FormationLayout` takes a `UIView` as its `rootView`.
 - `translatesAutoresizingMaskIntoConstraints` of `rootView` is not set to false by default but can be set in constructor.
 - `translatesAutoresizingMaskIntoConstraints` of subviews will be set to false automaticly.
 - Subviews with no `superView` will be added to `rootView` automaticly.
 */

demo { canvas, icon in
    FormationLayout(rootView: canvas)[icon].center(equalTo: canvas)
}

//: [Home](Home) | [Previous](@previous) | [Next](@next)
