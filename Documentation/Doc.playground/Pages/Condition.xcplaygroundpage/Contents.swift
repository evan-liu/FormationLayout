//: [Home](Home) | [Previous](@previous) | [Next](@next)

import UIKit
import FormationLayout

/*:
 ## Condition
 ----
 
 `layout.when()` creates constraints for one condition and its `not` creates constrains for otherwise. 
 
 Call `layout.update()` to activate the correct set of constraints and when condition changes.
 
 */

demo { canvas, icon in
    var isLoggedIn = false
    
    let layout = FormationLayout(rootView: canvas)
    let loggedInLayout = layout.when { isLoggedIn }
    
    layout[icon].centerX(equalTo: canvas)
    loggedInLayout[icon].top(equalTo: canvas, plus: 10)
    loggedInLayout.not[icon].centerY(equalTo: canvas)
    
    layout.update {
        isLoggedIn = true // Set to false to see the changes
    }
}

//: [Home](Home) | [Previous](@previous) | [Next](@next)
