//: [Home](Home) | [Previous](@previous) | [Next](@next)

import FormationLayout

/*:
## GroupFormation

All methods of `ViewFormation` are also avaliable in `GroupFormation`. The group will call the same method on each view but not the same view with the same attribute

    layout.group(v1, v2, v3).width(v1).center(v2)

will create 6 constraints:

- `.centerX(v1)`
    - v2.width = v1.width
    - v3.width = v1.width
- `.center(v2)`
    - v1.centerX = v2.centerX
    - v1.centerY = v2.centerY
    - v3.centerX = v2.centerX
    - v3.centerY = v2.centerY
*/

/*:
### View spaces

Use `hSpace()` and `vSpace()` methods to set spaces between views in a group.

    layout.group(v1, v2, v3).hSpace(10).vSpace(10)

### first, last and at

    layout.group(v1, v2, v3)
        .centerY(view)
        .first { $0.leading(view) }
        .last { $0.trailing(view) }
        .at(1) { $0.centerX(view) }
*/

demo3 { view, v1, v2, v3 in // Show Result of this line
    let layout = FormationLayout(rootView: view)
    
    layout.group(v1, v2, v3)
        .size(20)
        .centerY(view)
        .at(1) { $0.centerX(view) }
        .hSpace(10)
    
    layout.activate()
}

//: ### forEach

demo3 { view, v1, v2, v3 in // Show Result of this line
    let layout = FormationLayout(rootView: view)
    
    layout.group(v1, v2, v3)
        .forEach { v, index, _ in
            let distance = CGFloat(5 * index)
            let offset = 6 * distance
            v.size(20 + distance).leading(view + offset).top(view + offset)
        }
    
    layout.activate()
}

/*: 
### sameSize

Use `sameWidth()`, `sameHeight()` or `sameSize()` to make views in the group have the same size.
*/

demo3 { view, v1, v2, v3 in // Show Result of this line
    let layout = FormationLayout(rootView: view)
    
    layout.group(v1, v2, v3)
        .centerY(view)
        .first { $0.leading(view) }
        .last { $0.trailing(view) }
        .height(10)
        .hSpace(5)
        .sameWidth()
    
    layout.activate()
}

//: [Home](Home) | [Previous](@previous) | [Next](@next)
