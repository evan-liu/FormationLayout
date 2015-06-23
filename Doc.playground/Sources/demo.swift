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

public func demo(size size: CGFloat = 100, @noescape block: (UIView, UIView) -> Void) -> UIView {
    let view = createView(size: size)
    
    block(view, createIcon())
    
    view.layoutIfNeeded()
    return view
}

public func demo2(size size: CGFloat = 100, @noescape block: (UIView, UIView, UIView) -> Void) -> UIView {
    let view = createView(size: size)
    
    block(view, createIcon(), createIcon())
    
    view.layoutIfNeeded()
    return view
}

public func demo3(size size: CGFloat = 100, @noescape block: (UIView, UIView, UIView, UIView) -> Void) -> UIView {
    let view = createView(size: size)

    block(view, createIcon(), createIcon(), createIcon())
    
    view.layoutIfNeeded()
    return view
}

public func demo5(size size: CGFloat = 100, @noescape block: (UIView, UIView, UIView, UIView, UIView, UIView) -> Void) -> UIView {
    let view = createView(size: size)
    
    block(view, createIcon(), createIcon(), createIcon(), createIcon(), createIcon())
    
    view.layoutIfNeeded()
    return view
}