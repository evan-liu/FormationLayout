//: [Home](Home) | [Previous](@previous) | [Next](@next)

import FormationLayout

/*:
## LayoutGuide
----

`LayoutGuide` defines a rectangular area that can interact with Auto Layout. 

`LayoutGuide()` method creates [UILayoutGuide](https://developer.apple.com/library/prerelease/ios/documentation/UIKit/Reference/UILayoutGuide_Class_Reference/index.html) on iOS 9 and dummy `UIView` on iOS 8.

*/

//: You can use `LayoutGuide`s to define the space between elements in your layout

demo3 { view, v1, v2, v3 in 
    let layout = FormationLayout(rootView: view)
    
    let space1 = LayoutGuide()
    let space2 = LayoutGuide()
    
    layout.group(v1, space1, v2, space2, v3)
        .centerY(view)
        .first { $0.leading(view) }
        .last { $0.trailing(view) }
        .hSpace(0)
    
    layout.group(space1, space2).sameWidth()
    
    layout.activate()
}

//: `LayoutGuide`s can also act as a black box, containing a number of other views and controls. This lets you encapsulate part of your view, breaking your layout into modular chunks.

demo3 { view, v1, v2, v3 in 
    let layout = FormationLayout(rootView: view)
    
    let panel1 = LayoutGuide()
    let panel2 = LayoutGuide()
    let panel3 = LayoutGuide()
    
    layout.view(panel1).size(view / 2).top(view).leading(view)
    layout.view(panel2).size(view / 2).top(view).trailing(view)
    layout.view(panel3).width(view).height(view / 2).bottom(view).leading(view)
    
    layout.view(v1).center(panel1)
    layout.view(v2).center(panel2) 
    layout.view(v3).center(panel3)
    
    layout.activate()
}

//: [Home](Home) | [Previous](@previous) | [Next](@next)
