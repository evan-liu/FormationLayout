# FormationLayout

Work with auto layout and size class easily.

**Requires**: Swift 2, Xcode 7, iOS 8

**Note**: FormationLayout is still under development.

## Features

- Chaining methods
- Group layout
- Size class support

## API

### Create `FormationLayout`

```swift
import FormationLayout
class ViewController: UIViewController {
	var layout: FormationLayout!
    override func viewDidLoad() {
        super.viewDidLoad()
        layout = FormationLayout(rootView: view)
    }	
}
```

### Create and activate constraints for a view

```swift 
layout.view(btn).center(view).active = true
```

btn will be added to view if it has no superView yet. You can give it another container: 

```swift
layout.view(btn2, container: panel)
    .width(btn.width * 1.5)
    .centerX(panel)
    .top(panel.top + 20)
    .active = true
```

Call `layout.activate()` at the end instead of set `active` property for each view.

```swift
override func viewDidLoad() {
	super.viewDidLoad()
	layout = FormationLayout(rootView: view)
	layout.view(btn1).center(view)
	lyaout.view(btn2).centerX(btn1).top(btn1.bottom + 10)
	layout.activate()
}	
```
### Group layout

```swift
layout.group(btn1, btn2, btn3)
	.width(100) // Width of all buttons will be 100
	.top(view.top + 50)	// Will call the same method on each button
	.first { $0.leading(view.leading + 8) } // Place the first button
	.hSpace(10)	// The others will follow with space of 10
```

### Size class

```swift
class ViewController: UIViewController {
	var layout: FormationLayout!
    override func viewDidLoad() {
        super.viewDidLoad()
        layout = FormationLayout(rootView: view)
        
        layout.view(btn).centerX(view)
        layout.view(btn).top(view).install(.WRegular)
        layout.view(btn).bottom(view).install(.WCompact)
        
        layout.activate(traitCollection)
    }
    override func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        layout.activate(newCollection)
    }    
}
```

Use `layout.block {}` to install constaints to size class together.

```swift
class ViewController: UIViewController {
	var layout: FormationLayout!
    override func viewDidLoad() {
        super.viewDidLoad()
        layout = FormationLayout(rootView: view)
        
        //-- wAny hAny
        layout.view()
        //...
        
        //-- wCompact_hCompact
        layout.block {
            layout.view()
            layout.group()
            //...
        }.install(.BothCompact)
        
        //-- not wCompact_hCompact
        layout.block {
            //...
        }.except(.BothCompact)
        
        layout.activate(traitCollection)
    }
    override func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        layout.activate(newCollection)
    }    
}
```