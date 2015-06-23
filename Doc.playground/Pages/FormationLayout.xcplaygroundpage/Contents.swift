//: [Home](Home) | [Previous](@previous) | [Next](@next)

import UIKit
import FormationLayout

/*:
## FormationLayout
----

`FormationLayout` is the top level layout class for one root view.

- `FormationLayout` takes a `UIView` as its `rootView`.
- translatesAutoresizingMaskIntoConstraints of `rootView` and all added views will be set to false.
- Added view with no `superView` will be added to `rootView`.
*/

demo { view, icon in    // Show Result of this line
    var layout = FormationLayout(rootView: view)
    layout.view(icon).center(view).active = true
}

/*:
### ViewFormation

Use `ViewFormation` to create and manager a group of constraints of one view.

Create `ViewFormation` use `FormationLayout.view()` method.

    layout.view(icon)

### Activate constraints

Constraints are not active when they are created. 

If you have only one or two views you can set the `active` property to true. 

    layout.view(icon).center(view).active = true

Or you can use `activate()` method of `FormationLayout` instead after you setup all constraints.
*/

demo2 { view, v1, v2 in // Show Result of this line
    var layout = FormationLayout(rootView: view)
    
    layout.view(v1).centerY(view).leading(view)
    layout.view(v2).centerY(view).trailing(view)
    
    layout.activate()
}

//: [Home](Home) | [Previous](@previous) | [Next](@next)
