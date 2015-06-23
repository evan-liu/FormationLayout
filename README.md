# Formation Layout

![banner](https://raw.githubusercontent.com/evan-liu/FormationLayout/master/Doc.playground/Resources/banner.png)

Work with auto layout and size class easily.

**Requires**: Swift 2, Xcode 7, iOS 8

## Features

- Chaining methods
- Group layout
- Size class support


```swift
var layout = FormationLayout(rootView: view)

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
```
`.HRegular`

![image](https://cloud.githubusercontent.com/assets/126383/8302349/ec66d380-19e9-11e5-901b-2729c003c3f9.png)

`.HCompact`

![image](https://cloud.githubusercontent.com/assets/126383/8302394/2a59bab8-19ea-11e5-8b42-24a7c6a5a9b0.png)

## Documentation

### Playground

Clone the project then open Doc.xcworkspace (**not** Doc.playground). Play with the code and see the changes lively with playground. 

**Note:** Try to build the FormationLayout target if it cannot compile.

**Note:** Xcode 7 Beta 2 will not show live views correctly. 

### Wiki

The [Wiki pages](https://github.com/evan-liu/FormationLayout/wiki) have the same content as the Doc Playground. Go for Playground if you have Xcode 7 **Beta 1** installed and have fun playing with the code.

## Install 

Cocoapods (need to use git url as it doesn't support Swift 2 yet):

```
pod 'FormationLayout', :git => 'https://github.com/evan-liu/FormationLayout.git', :tag => '0.3.0'
```