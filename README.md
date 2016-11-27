# FormationLayout

![banner](https://github.com/evan-liu/FormationLayout/blob/master/Documentation/Doc.playground/Resources/banner.png)

## Documentation
 
`FormationLayout` is the top level layout class for one root view. 

- `FormationLayout` takes a `UIView` as its `rootView`.
- `translatesAutoresizingMaskIntoConstraints` of `rootView` is set to false by default but can also be true if set in constructor.
- `translatesAutoresizingMaskIntoConstraints` of subviews will be set to false automaticly.
- Subviews with no `superView` will be added to `rootView` automaticly.
 
```swift
demo { canvas, icon in
    FormationLayout(rootView: canvas)[icon].center(equalTo: canvas)
}
 ```
 
 ![FormationLayout](https://github.com/evan-liu/FormationLayout/blob/master/Documentation/Images/FormationLayout.png)
 
### Anchors

View anchors: left, right, top, bottom, leading, trailing, width, height, centerX, centerY, lastBaseline, firstBaseline, centerXWithinMargins, centerYWithinMargins
 
- `layout[view].anchor(equalTo: view2, multiplyBy: multiplier, plus: constant)`
  - view.anchor == view2.anchor * multiplier + constant
- `layout[view].anchor(equalTo: anchor2, of: view2, multiplyBy: multiplier, minus: constant)`
  - view.anchor == view2.anchor2 * multiplier - constant
- `layout[view].anchor(greaterThanOrEqualTo: view2)`
  - view.anchor >= view2.anchor
- `layout[view].anchor(lessThanOrEqualTo: value)` _(Only width and height)_
  - view.anchor <= value
  
```swift
demo { canvas, icon1, icon2, icon3 in
    let layout = FormationLayout(rootView: canvas)
    layout[icon1].top(equalTo: canvas, plus: 10).leading(equalTo: canvas, plus: 20)
    layout[icon2].top(equalTo: icon1).leading(equalTo: .trailing, of: icon1, plus: 10)
    layout[icon3].bottom(equalTo: canvas, minus: 10).leading(equalTo: icon1, multiplyBy: 2)
}
```

![Anchors](https://github.com/evan-liu/FormationLayout/blob/master/Documentation/Images/Anchors.png)

### Helpers
 
- size: width & height
- center: centerX & centerY

```swift
demo { canvas, icon1, icon2 in
    let layout = FormationLayout(rootView: canvas)
    layout[icon1].size(equalTo: 30).center(equalTo: canvas, multiplyBy: 0.8)
    layout[icon2].size(equalTo: icon1, minus: 10).center(equalTo: icon1, plus: 30)
}
```

![Helpers](https://github.com/evan-liu/FormationLayout/blob/master/Documentation/Images/Helpers.png)

### Pin
 
`layout[view].pin(to: canvas)` will set
 
- view.top == canvas.top
- view.bottom == canvas.bottom
- view.left == canvas.left
- view.right == canvas.right
 
`layout[view].pin(to: canvas, margin: 10)` will set
 
- view.top == canvas.top + 10
- view.bottom == canvas.bottom - 10
- view.left == canvas.left + 10
- view.right == canvas.right - 10

```swift
demo { canvas, icon1, icon2, icon3 in
    let layout = FormationLayout(rootView: canvas)
    layout[icon1].pin(to: canvas, edgesWithMargin: [.top: 10, .leading: 3])
    layout[icon2].pin(to: canvas, margin: 30)
    layout[icon3].pin(to: canvas, edges: [.topBottom, .trailing], margin: 3)
}
```

![Pin](https://github.com/evan-liu/FormationLayout/blob/master/Documentation/Images/Pin.png)

### Group
 
`layout.group(view1, view2)` will create same constraints for 
 
- layout[view1]
- layout[view2]

```swift
demo { canvas, icon1, icon2, icon3 in
    let layout = FormationLayout(rootView: canvas)
    layout.group(icon1, icon2, icon3).centerY(equalTo: canvas)
    layout[icon1].leading(equalTo: canvas, plus: 5)
    layout[icon2].centerX(equalTo: canvas)
    layout[icon3].trailing(equalTo: canvas, minus: 5)
}
```

![Group](https://github.com/evan-liu/FormationLayout/blob/master/Documentation/Images/Group.png)

### Condition
 
`layout.when()` creates constraints for one condition and its `not` creates constrains for otherwise. 

```swift
demo { canvas, icon in
    var isLoggedIn = true 
    
    let layout = FormationLayout(rootView: canvas)
    let loggedInLayout = layout.when { isLoggedIn }
    
    layout[icon].centerX(equalTo: canvas)
    loggedInLayout[icon].top(equalTo: canvas, plus: 10)
    loggedInLayout.not[icon].bottom(equalTo: canvas, minus: 10)
    
    layout.update()
}
```

![Condition](https://github.com/evan-liu/FormationLayout/blob/master/Documentation/Images/Condition.png)

`isLoggedIn = false`

![ConditionNot](https://github.com/evan-liu/FormationLayout/blob/master/Documentation/Images/ConditionNot.png)

## Playground

- Open **Documentation/Doc.xcworkspace**.
- Build the **FormationLayout-iOS** scheme (⌘+B).
- Open **Doc** playground in the **Project navigator**.
- Click "Show Result" button at the most right side of each `demo` line.

