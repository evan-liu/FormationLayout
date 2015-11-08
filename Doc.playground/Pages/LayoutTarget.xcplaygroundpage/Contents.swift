//: [Home](Home) | [Previous](@previous) | [Next](@next)

import UIKit
import FormationLayout

/*:

## LayoutTarget
---

`LayoutTarget` holds `secondItem`, `secondAttribute`, `multiplier` and `constant` of a `NSLayoutConstraint`.

Use extension methods of `UIView` to create `LayoutTarget` and `+ - * /` operators for `multiplier` and `constant` calculation.
*/

demo { canvas, icon1, icon2 in
    // Skip these 3 lines of code for now
    let layout = FormationLayout(rootView: canvas)
    layout.view(icon1).size(20).centerX(canvas).top(canvas)
    layout.view(icon2).centerX(canvas).bottom(canvas)
    
    // Look at only these 3 lines of code for now
    layout.view(icon2)
        .width(icon1.width * 1.5 + 20)
        .height(icon1 * 2.5)
}

/*:

    icon1.width * 1.5 + 20

Creates a `LayoutTarget` as:

- view: icon1
- attribute: .Width
- multiplier: 1.5
- constant: 20

The `secondAttribute` can be emitted if it is the same as `firstAttribute`.

    layout.view(icon2).height(icon1 * 2.5)

is the same as

    layout.view(icon2).height(icon1.height * 2.5)

*/

//: [Home](Home) | [Previous](@previous) | [Next](@next)
