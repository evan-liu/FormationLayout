//: [Home](Home) | [Previous](@previous) | [Next](@next)

import FormationLayout

/*:
## LayoutGuide
----

`LayoutGuide` defines a rectangular area that can interact with Auto Layout. 

`LayoutGuide()` method creates [UILayoutGuide](https://developer.apple.com/library/prerelease/ios/documentation/UIKit/Reference/UILayoutGuide_Class_Reference/index.html) on iOS 9 and dummy `UIView` on iOS 8.

*/

//: You can use `LayoutGuide`s to define the space between elements in your layout

demo { canvas, icon1, icon2, icon3 in
    let layout = FormationLayout(rootView: canvas)
    
    let space1 = LayoutGuide()
    let space2 = LayoutGuide()
    
    layout.group(icon1, space1, icon2, space2, icon3)
        .centerY(canvas)
        .first { $0.leading(canvas) }
        .last { $0.trailing(canvas) }
        .hSpace(0)
    
    layout.group(space1, space2).sameWidth()
}

//: `LayoutGuide`s can also act as a black box, containing a number of other views and controls. This lets you encapsulate part of your view, breaking your layout into modular chunks.

demo { canvas, icon1, icon2, icon3 in
    let layout = FormationLayout(rootView: canvas)
    
    let panel1 = LayoutGuide()
    let panel2 = LayoutGuide()
    let panel3 = LayoutGuide()
    
    layout.view(panel1).size(canvas / 2).top(canvas).leading(canvas)
    layout.view(panel2).size(canvas / 2).top(canvas).trailing(canvas)
    layout.view(panel3).width(canvas).height(canvas / 2).bottom(canvas).leading(canvas)
    
    layout.view(icon1).center(panel1)
    layout.view(icon2).center(panel2) 
    layout.view(icon3).center(panel3)
}

//: [Home](Home) | [Previous](@previous) | [Next](@next)
