//: [Home](Home) | [Previous](@previous) | [Next](@next)

import UIKit
import FormationLayout

/*:
 ## Abreast
 ----
 
- layout[logo].below(topLayoutGuide, plus: 10)
  - logo.top == topLayoutGuide.bottom + 10
- layout[copyright].above(bottomLayoutGuide, minus: 10)
  - copyright.bottom == bottomLayoutGuide.top - 10
 
 */

demo { canvas, icon1, icon2, icon3 in
    let layout = FormationLayout(rootView: canvas)
    layout[icon1].center(equalTo: canvas)
    layout[icon2].before(icon1).above(icon1)
    layout[icon3].after(icon1).below(icon1)
}

//: [Home](Home) | [Previous](@previous) | [Next](@next)
