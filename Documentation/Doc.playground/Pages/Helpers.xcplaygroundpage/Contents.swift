//: [Home](Home) | [Previous](@previous) | [Next](@next)

import UIKit
import FormationLayout

/*:
 ## Helpers
 ----
 
 - size: width & height
 - center: centerX & centerY
 
 */

demo { canvas, icon1, icon2 in
    let layout = FormationLayout(rootView: canvas)
    layout[icon1].size(equalTo: 30).center(equalTo: canvas, multiplyBy: 0.8)
    layout[icon2].size(equalTo: icon1, minus: 10).center(equalTo: icon1, plus: 30)
}

//: [Home](Home) | [Previous](@previous) | [Next](@next)
