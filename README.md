# FormationLayout

![banner](https://raw.githubusercontent.com/evan-liu/FormationLayout/master/Doc.playground/Resources/banner.png)

[![Cocoapods](https://img.shields.io/cocoapods/v/FormationLayout.svg)](https://cocoapods.org/)
[![Carthage](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Build Status](https://travis-ci.org/evan-liu/FormationLayout.svg)](https://travis-ci.org/evan-liu/FormationLayout)

## Features

- Chaining methods
- Group layout
- Size classes support
- LayoutGuide (`UILayoutGuide` on iOS 9, `UIView` on iOS 8)
- StackView (`UIStackView` on iOS 9, `UIView+FormationLayout` on iOS 8)

```swift
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
```
`.HRegular`

![image](https://cloud.githubusercontent.com/assets/126383/8302349/ec66d380-19e9-11e5-901b-2729c003c3f9.png)

`.HCompact`

![image](https://cloud.githubusercontent.com/assets/126383/8302394/2a59bab8-19ea-11e5-8b42-24a7c6a5a9b0.png)

## Install 

### CocoaPods 

```
pod 'FormationLayout', '~> 0.5.1'
```

### Carthage 

```
github "evan-liu/FormationLayout" >= 0.5.1
```

## Documentation

### Playground

Open Doc.xcworkspace (**not** Doc.playground). Play with the code and see the changes lively with playground. 

**Note:** Try to build the FormationLayout target if it cannot compile.

### Wiki

The [Wiki pages](https://github.com/evan-liu/FormationLayout/wiki) have the same content as the Doc Playground. 

- [FormationLayout](https://github.com/evan-liu/FormationLayout/wiki/FormationLayout)
- [LayoutTarget](https://github.com/evan-liu/FormationLayout/wiki/LayoutTarget)
- [FactoryMethods](https://github.com/evan-liu/FormationLayout/wiki/FactoryMethods)
- [Constraints](https://github.com/evan-liu/FormationLayout/wiki/Constraints)
- [GroupFormation](https://github.com/evan-liu/FormationLayout/wiki/GroupFormation)
- [SizeClass](https://github.com/evan-liu/FormationLayout/wiki/SizeClass)
- [LayoutGuide](https://github.com/evan-liu/FormationLayout/wiki/LayoutGuide)
- [StackView](https://github.com/evan-liu/FormationLayout/wiki/StackView)
