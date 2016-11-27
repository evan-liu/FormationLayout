//: [Home](Home) | [Previous](@previous) | [Next](@next)

import UIKit
import FormationLayout

/*:
 ## Anchors
 ----
 
 View anchors: left, right, top, bottom, leading, trailing, width, height, centerX, centerY, lastBaseline, firstBaseline, centerXWithinMargins, centerYWithinMargins
 
 - `layout[view].anchor(equalTo: view2, multiplyBy: multiplier, plus: constant)`
   - view.anchor == view2.anchor * multiplier + constant
 - `layout[view].anchor(equalTo: anchor2, of: view2, multiplyBy: multiplier, minus: constant)`
   - view.anchor == view2.anchor2 * multiplier - constant
 - `layout[view].anchor(greaterThanOrEqualTo: view2)`
   - view.anchor >= view2.anchor
 - `layout[view].anchor(lessThanOrEqualTo: value)` _(Only width and height)_
   - view.anchor <= value
 */

demo { canvas, icon1, icon2, icon3 in
    let layout = FormationLayout(rootView: canvas)
    layout[icon1].top(equalTo: canvas, plus: 10).leading(equalTo: canvas, plus: 20)
    layout[icon2].top(equalTo: icon1).leading(equalTo: .trailing, of: icon1, plus: 10)
    layout[icon3].bottom(equalTo: canvas, minus: 10).leading(equalTo: icon1, multiplyBy: 2)
}

//: [Home](Home) | [Previous](@previous) | [Next](@next)
