# Formation Layout

Work with auto layout and size class easily.

**Requires**: Swift 2, Xcode 7, iOS 8

**Note**: FormationLayout is still under development.

## Features

- Chaining methods
- Group layout
- Size class support

## Usage

- [FormationLayout](#formationlayout)
- [Create constraints](#create-constraints)
  - [ViewFormation](#viewformation)
    - [LayoutTarget](#layouttarget)
    - [Constant values](#constant-values)
    - [Another view](#another-view)
    - [Combined properties](#combined-properties)
    - [Positions](#positions)
    - [Relation](#relation)
    - [Priority](#priority)
  - [GroupFormation](#groupformation)
    - [View spaces](#view-spaces)
    - [first and last](#first-and-last)
    - [forEach](#foreach)
- [Capturing constraints](#capturing-constraints)
- [Activate constraints](#activate-constraints)
  - [active property](#active-property)
  - [activate method](#activate-method)
  - [Size classes](#size-classes)
    - [SizeClass](#sizeclass)
    - [Install and Except](#install-and-except)
    - [LayoutBlock](#layoutblock)

### FormationLayout

- `FormationLayout` takes a `UIView` as its `rootView`. 
- translatesAutoresizingMaskIntoConstraints of `rootView` and all added views will be set to false.
- Added view with no `superView` will be added to `rooView`.

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

### Create constraints

`NSLayoutConstraint` can be created by [ViewFormation](#viewformation) or [GroupFormation](#groupformation)

#### ViewFormation

Create `ViewFormation` use `FormationLayout.view()` method

```swift
func view(view: UIView, container: UIView? = nil) -> ViewFormation
```

`translatesAutoresizingMaskIntoConstraints` of the view will be set to fasle.

```swift
layout.view(v1) // v1 will be added to rootView if it has no superView yet.
layout.view(v2, container: panel) // v2 will be added/moved to panel
```

##### LayoutTarget

`LayoutTarget` holds `secondItem`, `secondAttribute`, `multiplier` and `constant` of a `NSLayoutConstraint`.

Use extension methods of `UIView` to create `LayoutTarget` and `+ - * /` operators for `multiplier` and `constant` calculation.

```swift
v1.width * 1.5 + 20
```

Creates a `LayoutTarget` as:

- view: v1
- attribute: .Width
- multiplier: 1.5
- constant: 20

```swift
layout.view(v1).width(v2.width + 20).height(v2.width * 0.5)
```

Will create two constraints: 

```swift
v1.width = v2.width + 20
```

- firstItem: v1
- firstAttribute: .Width
- secondItem: v2
- secondAttribute: .Width
- constant: 20

```swift
v1.height = v2.width * 0.5
```

- firstItem: v1
- firstAttribute: .Height
- secondItem: v2
- secondAttribute: .Width
- multiplier: 0.5

The 'secondAttribute' can be emitted if it is the same as 'firstAttribute'.

```swift
layout.view(v1).width(v2 + 10).height(v2 * 0.5) 
// same as
layout.view(v1).width(v2.width + 10).height(v2.height * 0.5)
```

##### Constant values

Some attributes can be set by constant values

```swift
layout.view(v1).width(100).height(30)
```

##### Another view

Use the `secondItem` itself to set the same attribute to be equal.

```swift
layout.view(v1).top(v2).bottom(v3) 
// same as
layout.view(v1).top(v2.top).bottom(v3.bottom)
```

##### Combined properties

`width` and `height` can be set together by combined property `size`.

```swift
layout.view(v1).size(100) 
// same as 
layout.view(v1).width(100).height(100)

layout.view(v1).size(v2) 
// same as 
layout.view(v1).width(v2.width).height(v2.height)
```

##### Positions

To put a view to some position of another view: 

```swift
layout.view(v1)
    .above(v2) // v1.Bottom = v2.Top
    .below(v3) // v1.Top = v3.Bottom
    .before(v4 - 10) // v1.Trailing = v4.Leading - 10
    .after(v5 + 10) // v1.Leading = v5.Trailing + 10
```

##### Relation

There are there relations

```swift
enum NSLayoutRelation : Int {
    case LessThanOrEqual
    case Equal
    case GreaterThanOrEqual
}
```

And four forms of UIView extension methods to create constraints:

```swift
layout.view(v1)
    .top(v2) // same as topEqual()
    .topEqual(v2) // v1.top == v2.top
    .topLessThanOrEqual(v2) // v1.top <= v2.top
    .topGreaterThanOrEqual(v2) // v1.top >= v2.top
```

##### Priority

Priority can be set when create constraints: 

```swift
layout.view(v1)
    .top(v2, priority: UILayoutPriorityDefaultHigh) 
    .bottom(v3) // priority is UILayoutPriorityRequired by default
```

#### GroupFormation

All methods of `ViewFormation` are also avaliable in `GroupFormation`. The group will call the same method on each view but not the same view with the same attribute

```swift
layout.group(v1, v2, v3).width(v1).center(v2)
```

will create 6 constraints: 

- `.centerX(v1)`
  - v2.width = v1.width
  - v3.width = v1.width
- `.center(v2)`
  - v1.centerX = v2.centerX
  - v1.centerY = v2.centerY
  - v3.centerX = v2.centerX
  - v3.centerY = v2.centerY

##### View spaces

Use `hSpace()` and `vSpace()` methods to set spaces between views in a group.

```swift
layout.group(v1, v2, v3).hSpace(10).vSpace(10)
```

##### first and last

```swift
layout.group(v1, v2, v3)
    .first { $0.after(v4) }
    .hSpace(10)
```

##### forEach

```swift
layout.view(icon3).center(view)

layout.group(icon1, icon2, icon3, icon4, icon5)
    .vSpace(10)
    .forEach { icon, index, group in
        icon.size(CGFloat(20 + 5 * index))
        if index > 0 {
            icon.trailing(group[index - 1].view.trailing + 20)
        }
    }
    .install(.HRegular)    

layout.group(icon1, icon2, icon3, icon4, icon5)
    .hSpace(10)
    .top(icon3)
    .forEach { icon, index, _ in
        icon.size(CGFloat(50 - 5 * abs(2 - index)))
    }  
    .install(.HCompact)    
```

![foreach](https://raw.githubusercontent.com/evan-liu/FormationLayoutDemo/master/images/foreach.png)

(left: `.HRegular`; right: `.HCompact`)

### Capturing constraints

Use a trailing block to capture constraints

```swift
var v1HConstraint: NSLayoutConstraint
var v1VConstraints = [NSLayoutConstraint]()
layout.view(v1)
	.centerX(v2) { v1HConstraint = $0 }
	.top(v3) { v1VConstraints.append($0) }
	.bottom(v4) { v1VConstraints.append($0) }
```

### Activate constraints

Constraints are not active when they are created. Activate them using `active` property of `ViewFormation` and `GropuFormation` or `activate()` method of `FormationLayout`

#### active property

If you have only one or two view/group you can set `active` property to true.

```swift
layout.view(v2).center(panel).active = true
layout.group(v1, v2, v3).centerY(v2).hSpace(10).active = true
```

#### activate method

If you have more views/groups use `activate()` method of `FormationLayout` instead after you setup all constraints.

```swift
layout.view()...
layout.group()...
...
layout.activate()
```

#### Size classes

Use size classes if you need different layouts on different sizes. Use `FormationLayout.activate()` method to switch constraints.

```swift
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
```

##### SizeClass

```swift
public enum SizeClass {
    case Any	// wAny_hAny
    case WCompact, WRegular // wCompact_hAny & wRegular_hAny
    case HCompact, HRegular // wAny_hCompact & wAny_hRegular
    case BothCompact, BothRegular // wCompact_hCompact & wRegular_hRegular
    case WCompactHRegular, WRegularHCompact // wCompact_hRegular & wRegular_hCompact
}
```

##### Install and Except

By default all constraints will be installed on `.Any`(wAny_hAny). `install()` method make the constraints only active on some sizes and `except()` methods make the constraints not active on some sizes.

Make sure your install/except methods cover all sizes.

```swift
layout.view(v1).width(100).install(.WCompact)
layout.view(v1).width(200).install(.WRegular)

layout.group(v1, v2, v3).vSpace(5).install(.BothCompact)
layout.group(v1, v2, v3).vSpace(10).except(.BothCompact)
```

##### LayoutBlock

Use `layout.block {}` to install constaints to size classes together.

```swift
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
```