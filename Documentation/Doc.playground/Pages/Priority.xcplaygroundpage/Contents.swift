//: [Home](Home) | [Previous](@previous)

import UIKit
import FormationLayout

/*:
 ## Priority
 ----
 
 All constraints have `UILayoutPriorityRequired` by default.
 
 */

demo { canvas, icon in
    let layout = FormationLayout(rootView: canvas)
    layout[icon].centerX(equalTo: canvas).size(equalTo: 20)
        .centerY(equalTo: canvas, at: UILayoutPriorityDefaultLow) // Try UILayoutPriorityRequired
        .bottom(equalTo: canvas, at: UILayoutPriorityDefaultHigh)
}

//: [Home](Home) | [Previous](@previous)

