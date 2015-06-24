//: [Home](Home) | [Previous](@previous)

import FormationLayout

/*:
## SizeClass
----

Use size classes if you need different layouts on different sizes. Use `FormationLayout.activate()` method to switch constraints.

    class ViewController: UIViewController {
        var layout: FormationLayout!
        override func viewDidLoad() {
            super.viewDidLoad()
            layout = FormationLayout(rootView: view)
            // ... Create constraints
            layout.activate(traitCollection)
        }
        override func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
            layout.activate(newCollection)
        }
    }
*/

demo5(size: 300) { view, v1, v2, v3, v4, v5 in // Show Result of this line
    let layout = FormationLayout(rootView: view)
    
    layout.view(v3).center(view)
    
    layout.group(v1, v2, v3, v4, v5)
        .vSpace(10)
        .forEach { icon, index, group in
            icon.size(CGFloat(25 + 5 * index))
            if index > 0 {
                icon.trailing(group[index - 1].view.trailing + 20)
            }
        }
        .install(.HRegular)
    
    layout.group(v1, v2, v3, v4, v5)
        .hSpace(10)
        .forEach { icon, index, group in
            let distance = CGFloat(abs(2 - index))
            icon.size(50 - 10 * distance)
            if index != 2 {
                icon.top(v3.top - 5 * distance)
            }
        }
        .install(.HCompact)
    
    // Try (.Compact, .Compact)!
    layout.activate(.Compact, .Regular)
}

/*:
### SizeClass

    public enum SizeClass {
        case Any	// wAny_hAny
        case WCompact, WRegular // wCompact_hAny & wRegular_hAny
        case HCompact, HRegular // wAny_hCompact & wAny_hRegular
        case BothCompact, BothRegular // wCompact_hCompact & wRegular_hRegular
        case WCompactHRegular, WRegularHCompact // wCompact_hRegular & wRegular_hCompact
    }


### Install and Except

By default all constraints will be installed on `.Any`(wAny_hAny). `install()` method make the constraints only active on some sizes and `except()` methods make the constraints not active on some sizes.

Make sure your install/except methods cover all sizes.

    layout.view(v1).width(100).install(.WCompact)
    layout.view(v1).width(200).install(.WRegular)

    layout.group(v1, v2, v3).vSpace(5).install(.BothCompact)
    layout.group(v1, v2, v3).vSpace(10).except(.BothCompact)

### LayoutBlock

Use `layout.block {}` to install constaints to size classes together.

    //-- wAny hAny
    // ... Create constraints

    //-- wCompact_hCompact
    layout.block {
    // ... Create constraints
    }.install(.BothCompact)

    //-- not wCompact_hCompact
    layout.block {
    // ... Create constraints
    }.except(.BothCompact)
*/


//: [Home](Home) | [Previous](@previous)
