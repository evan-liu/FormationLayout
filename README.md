# FormationLayout

Work with auto layout and size class easily.

**Requires**: Swift 2, Xcode 7, iOS 8

**Note**: FormationLayout is still under development.

## Features

- Chainable syntax
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
	.width(100)
	.top(view.top + 50)
	.first { $0.leading(view.leading + 8) }
	.hSpace(10)
```

### Size class

```swift
class ViewController: UIViewController {
	var layout: FormationLayout!
    override func viewDidLoad() {
        super.viewDidLoad()
        layout = FormationLayout(rootView: view)
        
        layout.view(btn).centerX(view)
        layout.view(btn).top(view).install(.HRegular)
        layout.view(btn).bottom(view).install(.HCompact)
        
        layout.activate(traitCollection)
    }
    override func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        layout.activate(newCollection)
    }    
}
```

Use `layout.block {}` to install constaints together.

```swfit
class ViewController: UIViewController {
	var layout: FormationLayout!
    override func viewDidLoad() {
        super.viewDidLoad()
        layout = FormationLayout(rootView: view)
        
        //-- wAny hAny
        layout.view()
        //...
        
        //-- wCompact hCompact
        layout.block {
            layout.view()
            layout.group()
            //...
        }.install(.BothCompact)
        
        //-- not wCompact hCompact
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