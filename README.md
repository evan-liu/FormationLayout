# FormationLayout

![banner](https://raw.githubusercontent.com/evan-liu/FormationLayout/master/Doc.playground/Resources/banner.png)

**Requires**: Swift 2, Xcode 7, iOS 8

## Features

- Chaining methods
- Group layout
- Size classes support
- LayoutGuide (`UILayoutGuide` on iOS 9, `UIView` on iOS 8)
- StackView (`UIStackView` on iOS 9, `UIView+FormationLayout` on iOS 8)

```swift
let layout = FormationLayout(rootView: view)

layout.view(v3).center(view)

layout.group(v1, v2, v3, v4, v5)
    .vSpace(10)
    .forEach { icon, index, group in
        icon.size(CGFloat(25 + 5 * index))
        if index > 0 {
            icon.trailing(group.viewAt(index - 1) + 20)
        }
    }
    .install(.HRegular)

layout.group(v1, v2, v3, v4, v5)
    .hSpace(10)
    .forEach { icon, index, group in
        let distance = CGFloat(abs(2 - index))
        icon.size(50 - 10 * distance)
        if index != 2 {
            icon.top(v3 - 5 * distance)
        }
    }
    .install(.HCompact)
```
`.HRegular`

![image](https://cloud.githubusercontent.com/assets/126383/8302349/ec66d380-19e9-11e5-901b-2729c003c3f9.png)

`.HCompact`

![image](https://cloud.githubusercontent.com/assets/126383/8302394/2a59bab8-19ea-11e5-8b42-24a7c6a5a9b0.png)

## Documentation

- [FormationLayout](https://github.com/evan-liu/FormationLayout/wiki/FormationLayout)
- [LayoutTarget](https://github.com/evan-liu/FormationLayout/wiki/LayoutTarget)
- [FactoryMethods](https://github.com/evan-liu/FormationLayout/wiki/FactoryMethods)
- [Constraints](https://github.com/evan-liu/FormationLayout/wiki/Constraints)
- [GroupFormation](https://github.com/evan-liu/FormationLayout/wiki/GroupFormation)
- [SizeClass](https://github.com/evan-liu/FormationLayout/wiki/SizeClass)
- [LayoutGuide](https://github.com/evan-liu/FormationLayout/wiki/LayoutGuide)
- [StackView](https://github.com/evan-liu/FormationLayout/wiki/StackView)
