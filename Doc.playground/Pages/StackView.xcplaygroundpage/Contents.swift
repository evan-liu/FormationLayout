//: [Home](Home) | [Previous](@previous)

import FormationLayout

/*:
## StackView
----

`StackView` provides a streamlined interface for laying out a collection of views in either a column or a row. 

`StackView()` method creates [UIStackView](https://developer.apple.com/library/prerelease/ios/documentation/UIKit/Reference/UIStackView_Class_Reference/) on iOS 9 and `UIView + FormationLayout` on iOS 8.

`StackView` itself is a `View` so use `view()` or `group()` method of `FormationLayout` to set its size or position. 

Use `StackViewConfig` to configuration distribution and alignment of its arrangedSubviews.

*/

demo3 { view, v1, v2, v3 in // Show Result of this line
    let stack = StackView(arrangedSubviews: [v1, v2, v3], config: StackViewConfig(axis: .Vertical))
    FormationLayout(rootView: view).view(stack).center(view).active = true
}

/*:
Use `stack()` method to have different configuration and even different arrangedSubviews on different size classes.
*/

demo3 { view, v1, v2, v3 in // Show Result of this line
    let layout = FormationLayout(rootView: view)
    
    let stack = StackView()
    layout.view(stack).center(view)
    
    let hRegularConfig = StackViewConfig(axis: .Vertical, distribution: .Fill, alignment: .Fill, spacing: 5)
    layout.stack(stack, config: hRegularConfig, arrangedSubviews: [v1, v2, v3]).install(.HRegular)
    
    var hCompactConfig = hRegularConfig
    hCompactConfig.axis = .Horizontal
    hCompactConfig.spacing = 20
    layout.stack(stack, config: hCompactConfig, arrangedSubviews: [v1, v2]).install(.HCompact)

    // Try (.Regular, .Compact)!
    layout.activate(.Regular, .Regular)
}

//: [Home](Home) | [Previous](@previous)
