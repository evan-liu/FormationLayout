//: [Home](Home) | [Previous](@previous) | [Next](@next)

import FormationLayout

/*:
## GroupFormation

All methods of `ViewFormation` are also avaliable in `GroupFormation`. The group will call the same method on each view but not the same view with the same attribute

    layout.group(icon1, icon2, icon3).width(icon1).center(icon2)

will create 6 constraints:

- `.centerX(icon1)`
    - icon2.width = icon1.width
    - icon3.width = icon1.width
- `.center(icon2)`
    - icon1.centerX = icon2.centerX
    - icon1.centerY = icon2.centerY
    - icon3.centerX = icon2.centerX
    - icon3.centerY = icon2.centerY
*/

/*:
### View spaces

Use `hSpace()` and `vSpace()` methods to set spaces between views in a group.

    layout.group(icon1, icon2, icon3).hSpace(10).vSpace(10)

### first, last and at

    layout.group(icon1, icon2, icon3)
        .centerY(canvas)
        .first { $0.leading(view) }
        .last { $0.trailing(view) }
        .at(1) { $0.centerX(view) }
*/

demo { canvas, icon1, icon2, icon3 in
    FormationLayout(rootView: canvas).group(icon1, icon2, icon3)
        .size(20)
        .centerY(canvas)
        .at(1) { $0.centerX(canvas) }
        .hSpace(10)
}

//: ### forEach

demo { canvas, icon1, icon2, icon3 in
    FormationLayout(rootView: canvas).group(icon1, icon2, icon3)
        .forEach { v, index, _ in
            let distance = CGFloat(5 * index)
            let offset = 6 * distance
            v.size(20 + distance).leading(canvas + offset).top(canvas + offset)
        }
}

/*: 
### sameSize

Use `sameWidth()`, `sameHeight()` or `sameSize()` to make views in the group have the same size.
*/

demo { canvas, icon1, icon2, icon3 in
    FormationLayout(rootView: canvas).group(icon1, icon2, icon3)
        .centerY(canvas)
        .first { $0.leading(canvas) }
        .last { $0.trailing(canvas) }
        .height(10)
        .hSpace(5)
        .sameWidth()
}

//: [Home](Home) | [Previous](@previous) | [Next](@next)
