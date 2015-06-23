//: [Home](Home) | [Previous](@previous) | [Next](@next)

/*:
## Constraints
----

    layout.view(v1).width(v2.height * 1.5 + 20)

Created a `NSLayoutConstraint` with

- firstItem: v1
- firstAttribute: .Width
- secondItem: v2
- secondAttribute: .Height
- multiplier: 1.5
- constant: 20

and

- relation: .Equal
- priority: UILayoutPriorityRequired

If you want to have other values for relation and priority, here is an example:

    layout.view(v1).widthLessThanOrEqual(v2.height * 1.5 + 20, priority: UILayoutPriorityDefaultHigh)

If you want to take full control, use `attribute()` methods like:

    layout.view(v1).attribute(.Width, relatedBy: GreaterThanOrEqual, target: v2.height * 1.5 + 20, 
        priority: UILayoutPriorityDefaultHigh) { constraint in
        
        // Do more with constraint
    }

You can always use a trailing block to capture constraints: 

    layout.view(v1).width(10) { v1WidthConstraint = $0 }

*/

//: [Home](Home) | [Previous](@previous) | [Next](@next)
