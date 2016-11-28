//: [Home](Home) | [Previous](@previous) | [Next](@next)

import UIKit
import FormationLayout

/*:
 ## Helpers
 ----
 
 - aspectRatio: `width:height`
 - size: width & height
 - center: centerX & centerY
 
 */

demo { canvas, icon1, icon2, icon3 in
    let layout = FormationLayout(rootView: canvas)
    layout[icon1].aspectRatio(equalTo: 1.5).width(equalTo: 30)
    layout[icon2].size(equalTo: 30).center(equalTo: canvas, multiplyBy: 0.8)
    layout[icon3].size(equalTo: icon2, minus: 10).center(equalTo: icon2, plus: 30)
}

//: [Home](Home) | [Previous](@previous) | [Next](@next)
