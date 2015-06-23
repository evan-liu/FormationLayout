//: [Home](Home) | [Previous](@previous) | [Next](@next)

import Foundation
import FormationLayout

/*:
## Constraint Factory Methods
----

`LayoutTarget` is one format of Constraint Factory Methods. You can also create constraints by constants or another view. 

*/

demo3 { view, v1, v2, v3 in // Show Result of this line
    var layout = FormationLayout(rootView: view)
    
    layout.view(v1).width(view.width / 5).height(20).center(view)
    
    layout.view(v2).width(v1.width).height(v1).centerX(view).above(v1 - 5)
    
    layout.view(v3).size(20).centerX(v1).below(v1 + 5)
    
    layout.activate()
}

/*:
### LayoutTarget

Width of both v1 and v2 are set by `LayoutTarget`.

### Constant Value

For now only width and height support constant values.

### Another View

You can use another view if you are setting the same attribute of two views.

    layout.view(v2).width(v1.width).height(v1.height)

is the same as 

    layout.view(v2).width(v1).height(v1)

### Combined properties

You can set width and height together by size. Also center as centerX and centerY. 

    layout.view(v1).center(view)
    //-> v1.centerX = view.centerX
    //-> v1.centerY = view.centerY

and 

    layout.view(v3).size(20)
    //-> v3.width = 20
    //-> v3.height = 20

The code above to set width and height of v2 can now be
    
    layout.view(v2).size(v1)

### Positions

There are 4 methods to set one view to some position of another view: 

    layout.view(v2).above(v1 - 5) //-> v2.bottom = v1.top - 5
    layout.view(v3).below(v1 + 5) //-> v3.top = v1.bottom + 5

Similarly

    layout.view(v1).before(v2) //-> v1.trailing = v2.leading
    layout.view(v1).after(v2)  //-> v1.leading = v2.trailing
    
*/

//: [Home](Home) | [Previous](@previous) | [Next](@next)
