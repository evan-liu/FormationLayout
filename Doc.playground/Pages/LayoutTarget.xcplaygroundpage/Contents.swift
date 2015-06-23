//: [Home](Home) | [Previous](@previous) | [Next](@next)

import UIKit
import FormationLayout

/*:

## LayoutTarget
---

`LayoutTarget` holds `secondItem`, `secondAttribute`, `multiplier` and `constant` of a `NSLayoutConstraint`.

Use extension methods of `UIView` to create `LayoutTarget` and `+ - * /` operators for `multiplier` and `constant` calculation.
*/

demo2 { view, v1, v2 in // Show Result of this line
    var layout = FormationLayout(rootView: view)
    layout.view(v1).size(20).centerX(view).top(view)
    layout.view(v2).centerX(view).bottom(view)
    
    // Look at these 3 lines of code only
    layout.view(v2)
        .width(v1.width * 1.5 + 20)
        .height(v1 * 2.5)
    
    layout.activate()
}

/*:

v1.width * 1.5 + 20

Creates a `LayoutTarget` as:

- view: v1
- attribute: .Width
- multiplier: 1.5
- constant: 20

The 'secondAttribute' can be emitted if it is the same as 'firstAttribute'.

layout.view(v2).height(v1 * 2.5)

is the same as

layout.view(v2).height(v1.height * 2.5)

*/


//: [Home](Home) | [Previous](@previous) | [Next](@next)
