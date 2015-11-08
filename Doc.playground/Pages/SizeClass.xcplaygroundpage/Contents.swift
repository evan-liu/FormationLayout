//: [Home](Home) | [Previous](@previous) | [Next](@next)

import FormationLayout

/*:
## SizeClass
----

Use size classes if you need different layouts on different sizes. Use `FormationLayout.activate()` method to switch constraints.

Set `activateAddedFormations` to false when create the `FormationLayout` if you want to activate it later with size classes. 

    class ViewController: UIViewController {
        var layout: FormationLayout!
        override func viewDidLoad() {
            super.viewDidLoad()
            layout = FormationLayout(rootView: view, activateAddedFormations: false)
            // ... Create constraints
            layout.activate(traitCollection)
        }
        override func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
            layout.activate(newCollection)
        }
    }
*/

demo(size: 300) { canvas, icon1, icon2, icon3, icon4, icon5 in
    let layout = FormationLayout(rootView: canvas, activateAddedFormations: false)
    
    layout.view(icon3).center(canvas)
    
    layout.group(icon1, icon2, icon3, icon4, icon5)
        .vSpace(10)
        .forEach { icon, index, group in
            icon.size(CGFloat(25 + 5 * index))
            if index > 0 {
                icon.trailing(group.viewAt(index - 1) + 20)
            }
        }
        .install(.HRegular)
    
    layout.group(icon1, icon2, icon3, icon4, icon5)
        .hSpace(10)
        .forEach { icon, index, group in
            let distance = CGFloat(abs(2 - index))
            icon.size(50 - 10 * distance)
            if index != 2 {
                icon.top(icon3 - 5 * distance)
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

    layout.view(icon1).width(100).install(.WCompact)
    layout.view(icon1).width(200).install(.WRegular)

    layout.group(icon1, icon2, icon3).vSpace(5).install(.BothCompact)
    layout.group(icon1, icon2, icon3).vSpace(10).except(.BothCompact)

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

//: [Home](Home) | [Previous](@previous) | [Next](@next)
