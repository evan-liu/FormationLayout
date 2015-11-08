import UIKit

public func createIcon() -> UIView {
    return UIImageView(image: UIImage(named: "swift"))
}

public func createView(size size: CGFloat = 100) -> UIView {
    let view = UIView(frame: CGRectMake(0, 0, size, size))
    view.layer.backgroundColor = UIColor.whiteColor().CGColor
    view.layer.borderColor = UIColor.lightGrayColor().CGColor
    view.layer.borderWidth = 0.2
    return view
}

public func layoutView(view: UIView, size: CGFloat = 100) {
    NSLayoutConstraint(item: view, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: size).active = true
    NSLayoutConstraint(item: view, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: size).active = true
    view.layoutIfNeeded()
}

public func demo(size size: CGFloat = 100, @noescape block: (UIView, UIView) -> Void) -> UIView {
    let view = createView(size: size)
    
    block(view, createIcon())
    
    layoutView(view, size: size)
    return view
}

public func demo(size size: CGFloat = 100, @noescape block: (UIView, UIView, UIView) -> Void) -> UIView {
    let view = createView(size: size)
    
    block(view, createIcon(), createIcon())
    
    layoutView(view, size: size)
    return view
}

public func demo(size size: CGFloat = 100, @noescape block: (UIView, UIView, UIView, UIView) -> Void) -> UIView {
    let view = createView(size: size)

    block(view, createIcon(), createIcon(), createIcon())
    
    layoutView(view, size: size)
    return view
}

public func demo(size size: CGFloat = 100, @noescape block: (UIView, UIView, UIView, UIView, UIView, UIView) -> Void) -> UIView {
    let view = createView(size: size)
    
    block(view, createIcon(), createIcon(), createIcon(), createIcon(), createIcon())
    
    layoutView(view, size: size)
    return view
}