//: [Home](Home) | [Previous](@previous) | [Next](@next)

import Foundation
import FormationLayout

/*:
## Constraint Factory Methods
----

`LayoutTarget` is one format of Constraint Factory Methods. You can also create constraints by constants or another view. 

*/

demo { canvas, icon1, icon2, icon3 in
    let layout = FormationLayout(rootView: canvas)
    
    layout.view(icon1).width(canvas.width / 5).height(20).center(canvas)
    
    layout.view(icon2).width(icon1.width).height(icon1).centerX(canvas).above(icon1 - 5)
    
    layout.view(icon3).size(20).centerX(icon1).below(icon1 + 5)
}

/*:
### LayoutTarget

Width of both icon1 and icon2 are set by `LayoutTarget`.

### Constant Value

For now only width and height support constant values.

### Another View

You can use another view if you are setting the same attribute of two views.

    layout.view(icon2).width(icon1.width).height(icon1.height)

is the same as 

    layout.view(icon2).width(icon1).height(icon1)

### Combined properties

You can set width and height together by size. Also center as centerX and centerY. 

    layout.view(icon1).center(canvas)
    //-> icon1.centerX = canvas.centerX
    //-> icon1.centerY = canvas.centerY

and 

    layout.view(icon3).size(20)
    //-> icon3.width = 20
    //-> icon3.height = 20

The code above to set width and height of icon2 can now be
    
    layout.view(icon2).size(icon1)

### Positions

There are 4 methods to set one view to some position of another view: 

    layout.view(icon2).above(icon1 - 5) //-> icon2.bottom = icon1.top - 5
    layout.view(icon3).below(icon1 + 5) //-> icon3.top = icon1.bottom + 5

Similarly

    layout.view(icon1).before(icon2) //-> icon1.trailing = icon2.leading
    layout.view(icon1).after(icon2)  //-> icon1.leading = icon2.trailing

*/

//: ### To Self

demo { canvas, icon1, icon2, icon3 in
    let layout = FormationLayout(rootView: canvas)
    
    layout.view(icon1).centerX(canvas).top(canvas).width(20).heightToWidth()
    layout.view(icon2).center(canvas).height(20).widthToHeight(by: 1.2, plus: 6)
    layout.view(icon3).centerX(canvas).bottom(canvas).height(20).widthToHeight(by: 1.5)
}

/*:
    layout.view(icon1).heightToWidth()
    //-> icon1.height = icon1.width

    layout.view(icon2).widthToHeight(by: 1.2, plus: 6)
    //-> icon2.width = icon2.height * 1.2 + 6
*/

//: ### To Container (superview)

demo { canvas, icon1, icon2, icon3 in
    canvas.layout {
        $0.view(icon1).pinLeading(padding: 10).pinTop(padding: 10)
        $0.view(icon2).fillWidth(padding: 10).pinCenterY(offset: 5)
        $0.view(icon3).pinTrailing().pinBottom()
    }
}

//: [Home](Home) | [Previous](@previous) | [Next](@next)
