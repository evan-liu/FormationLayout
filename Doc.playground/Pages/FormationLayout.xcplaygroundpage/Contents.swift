//: [Home](Home) | [Previous](@previous) | [Next](@next)

import UIKit
import FormationLayout

/*:
## FormationLayout
----

`FormationLayout` is the top level layout class for one root view.

- `FormationLayout` takes a `UIView` as its `rootView`.
- `translatesAutoresizingMaskIntoConstraints` of added views (except `rootView`) will be set to false automaticly.
- Added view with no `superView` will be added to `rootView`.
*/

demo { canvas, icon in
    FormationLayout(rootView: canvas)
        .view(icon).center(canvas)
}

/*:
### ViewFormation

Use `ViewFormation` to create and manager a group of constraints of one view.

Create `ViewFormation` use `FormationLayout.view()` method.

    layout.view(icon)
*/

demo { canvas, icon1, icon2 in
    let layout = FormationLayout(rootView: canvas)
    
    layout.view(icon1).centerY(canvas).leading(canvas)
    layout.view(icon2).centerY(canvas).trailing(canvas) 
}

//: [Home](Home) | [Previous](@previous) | [Next](@next)
