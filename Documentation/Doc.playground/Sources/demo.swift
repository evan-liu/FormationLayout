import UIKit

public func createIcon() -> UIView {
    return UIImageView(image: UIImage(named: "swift"))
}

public func createView(size: CGFloat = 100) -> UIView {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: size, height: size))
    view.layer.backgroundColor = UIColor.white.cgColor
    view.layer.borderColor = UIColor.lightGray.cgColor
    view.layer.borderWidth = 0.2
    return view
}


public func layoutView(view: UIView, size: CGFloat = 100) {
    NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: size).isActive = true
    NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: size).isActive = true
    view.layoutIfNeeded()
}

public func demo(size: CGFloat = 100, block:(UIView, UIView) -> Void) -> UIView {
    let view = createView(size: size)
    
    block(view, createIcon())
    
    layoutView(view: view, size: size)
    return view
}

public func demo(size: CGFloat = 100, block: (UIView, UIView, UIView) -> Void) -> UIView {
    let view = createView(size: size)
    
    block(view, createIcon(), createIcon())
    
    layoutView(view: view, size: size)
    return view
}

public func demo(size: CGFloat = 100, block: (UIView, UIView, UIView, UIView) -> Void) -> UIView {
    let view = createView(size: size)

    block(view, createIcon(), createIcon(), createIcon())
    
    layoutView(view: view, size: size)
    return view
}

public func demo(size: CGFloat = 100, block: (UIView, UIView, UIView, UIView, UIView, UIView) -> Void) -> UIView {
    let view = createView(size: size)
    
    block(view, createIcon(), createIcon(), createIcon(), createIcon(), createIcon())
    
    layoutView(view: view, size: size)
    return view
}
