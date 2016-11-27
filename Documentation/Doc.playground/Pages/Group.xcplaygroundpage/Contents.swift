//: [Home](Home) | [Previous](@previous) | [Next](@next)

import UIKit
import FormationLayout

/*:
 ## Group
 ----
 
 `layout.group(view1, view2)` will create same constraints for 
 
 - layout[view1]
 - layout[view2]
 
 */

demo { canvas, icon1, icon2, icon3 in
    let layout = FormationLayout(rootView: canvas)
    layout.group(icon1, icon2, icon3).centerY(equalTo: canvas)
    layout[icon1].leading(equalTo: canvas, plus: 5)
    layout[icon2].centerX(equalTo: canvas)
    layout[icon3].trailing(equalTo: canvas, minus: 5)
}

//: [Home](Home) | [Previous](@previous) | [Next](@next)
