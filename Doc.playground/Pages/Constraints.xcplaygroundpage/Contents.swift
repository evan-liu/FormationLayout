//: [Home](Home) | [Previous](@previous) | [Next](@next)

/*:
## Constraints
----

    layout.view(icon1).width(icon2.height * 1.5 + 20)

Created a `NSLayoutConstraint` with

- firstItem: icon1
- firstAttribute: .Width
- secondItem: icon2
- secondAttribute: .Height
- multiplier: 1.5
- constant: 20

and

- relation: .Equal
- priority: UILayoutPriorityRequired

If you want to have other values for relation and priority, here is an example:

    layout.view(icon1).widthLessThanOrEqual(icon2.height * 1.5 + 20, priority: UILayoutPriorityDefaultHigh)

If you want to take full control, use `attribute()` methods like:

    layout.view(icon1).attribute(.Width, relatedBy: GreaterThanOrEqual, target: icon2.height * 1.5 + 20, 
        priority: UILayoutPriorityDefaultHigh) { constraint in
        
        // Do more with constraint
    }

You can always use a trailing block to capture constraints: 

    layout.view(icon1).width(10) { icon1WidthConstraint = $0 }

*/

//: [Home](Home) | [Previous](@previous) | [Next](@next)
