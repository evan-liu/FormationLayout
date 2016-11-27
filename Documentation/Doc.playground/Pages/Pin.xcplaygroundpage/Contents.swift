//: [Home](Home) | [Previous](@previous) | [Next](@next)

import UIKit
import FormationLayout

/*:
 ## Pin
 ----
 
 `layout[view].pin(to: canvas)` will set
 
 - view.top == canvas.top
 - view.bottom == canvas.bottom
 - view.left == canvas.left
 - view.right == canvas.right
 
 `layout[view].pin(to: canvas, margin: 10)` will set
 
 - view.top == canvas.top + 10
 - view.bottom == canvas.bottom - 10
 - view.left == canvas.left + 10
 - view.right == canvas.right - 10
 
 */

demo { canvas, icon1, icon2, icon3 in
    let layout = FormationLayout(rootView: canvas)
    layout[icon1].pin(to: canvas, edgesWithMargin: [.top: 10, .leading: 3])
    layout[icon2].pin(to: canvas, margin: 30)
    layout[icon3].pin(to: canvas, edges: [.topBottom, .trailing], margin: 3)
}

//: [Home](Home) | [Previous](@previous) | [Next](@next)
