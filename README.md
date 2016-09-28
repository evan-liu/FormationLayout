# FormationLayout

![banner](https://raw.githubusercontent.com/evan-liu/FormationLayout/master/Doc.playground/Resources/banner.png)

![Platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)
[![CocoaPods](https://img.shields.io/cocoapods/v/FormationLayout.svg)](https://cocoapods.org/)
[![Carthage](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Codecov](https://img.shields.io/codecov/c/github/evan-liu/FormationLayout.svg)](https://codecov.io/github/evan-liu/FormationLayout)
[![CocoaDocs](https://img.shields.io/cocoapods/metrics/doc-percent/FormationLayout.svg)](http://cocoadocs.org/docsets/FormationLayout)

Swift 3 version is working in progress at [swift3](https://github.com/evan-liu/FormationLayout/tree/swift3) branch

## Features

- Chaining methods
- [Group layout](https://github.com/evan-liu/FormationLayout/wiki/GroupFormation)
- [Size classes support](https://github.com/evan-liu/FormationLayout/wiki/SizeClass)
- [LayoutGuide](https://github.com/evan-liu/FormationLayout/wiki/LayoutGuide) (`UILayoutGuide` on iOS 9, `UIView` on iOS 8)
- [StackView](https://github.com/evan-liu/FormationLayout/wiki/StackView) (`UIStackView` on iOS 9, `UIView+FormationLayout` on iOS 8)

## Demos

Open `Demos.xcworkspace`, run `FormationLayoutDemos` target. 

### CustomViewDemo

```swift
class CustomView: UIView {
    init() {
        super.init(frame: CGRectZero)
        
        let bg = demoView(backgroundColor: demoBackgroundColor())
        let label = demoLabel("Email: ")
        let textfield = demoTextfield("Input here...")
        let button = demoButton("Submit")
        
        layout {
            $0.view(bg).fill()
            $0.view(label).pinCenterY().pinLeading(padding:50)
            $0.view(textfield).centerY(label).after(label + 10)
            $0.view(button).pinCenterX().below(label + 20)
        }
    }
}
```

![image](https://cloud.githubusercontent.com/assets/126383/12078138/0d7679fc-b26c-11e5-9d47-dfdb3ac7cac5.png)

### SizeClassDemo

```swift
class SizeClassDemo: UIViewController {
    
    var layouter: FormationLayout!
    
    override func viewDidLoad() {
        view.backgroundColor = demoBackgroundColor()
        
        let label = demoLabel("Email: ")
        let textfield = demoTextfield("Input here...")
        let button = demoButton("Submit")

        layouter = view.layout(activateAddedFormations: false)
        layouter.view(label).pinLeading(padding:10).top(topLayoutGuideView.bottom + 10)
        
        layouter.block {
            layouter.view(textfield).centerY(label).after(label + 10)
            layouter.view(button).leading(label).below(label + 10)
        }.install(.HRegular)
        
        layouter.block {
            layouter.view(textfield).leading(label).below(label + 10)
            layouter.view(button).leading(textfield).below(textfield + 10)
        }.install(.HCompact)
        
        layouter.activate(traitCollection)
    }
    
    override func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        layouter.activate(newCollection)
    }   
}
```

`.HRegular`

![image](https://cloud.githubusercontent.com/assets/126383/12078196/ff413718-b26c-11e5-9a92-e41081268c2c.png)

`.HCompact`

![image](https://cloud.githubusercontent.com/assets/126383/12078206/31dde69e-b26d-11e5-8532-f64e494a8e3e.png)

### StackViewDemo

`StackView()` will create `UIStackView` on iOS 9 and `UIView` + `GroupFormation` on iOS 8.

```swift
class StackViewDemo: UIViewController {
    
    var layouter: FormationLayout?
    
    override func viewDidLoad() {
        view.backgroundColor = demoBackgroundColor()
        
        let stack = StackView(arrangedSubviews: [
            demoButton(),
            demoLabel("Try to rotate the device or simulator"),
            demoTextfield()
        ])
        
        layouter = view.layout(activateAddedFormations: false) {
            $0.view(stack).size(300).pinCenter()
            
            let hCompactConfig = StackViewConfig(distribution: .EqualSpacing, alignment: .Center, spacing: 20)
            $0.stack(stack, config: hCompactConfig).install(.HCompact)
            
            var hRegularConfig = hCompactConfig
            hRegularConfig.axis = .Vertical
            $0.stack(stack, config: hRegularConfig).install(.HRegular)
            
            $0.activate(traitCollection)
        }
    }
    
    override func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        layouter?.activate(newCollection)
    }
    
}
```

## Install 

### CocoaPods 

```
pod 'FormationLayout', '~> 0.7.0'
```

### Carthage 

```
github "evan-liu/FormationLayout" >= 0.7.0
```

## Documentation

### Playground

Open `Doc.xcworkspace` (**not** `Doc.playground`). Play with the code and see the changes lively with playground. 

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
