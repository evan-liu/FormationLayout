/**
 *  FormationLayout
 *
 *  Copyright (c) 2016 Evan Liu. Licensed under the MIT license, as follows:
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 */

import UIKit

extension ConstraintMaker {
    
    @discardableResult
    public func leading(equalTo value: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .leading, relatedBy: .equal, constant: value, priority: priority)
    }
    
    @discardableResult
    public func leading(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .leading, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    @discardableResult
    public func leading(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return leading(equalTo: .leading, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    @discardableResult
    public func trailing(equalTo value: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .trailing, relatedBy: .equal, constant: value, priority: priority)
    }
    
    @discardableResult
    public func trailing(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .trailing, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    @discardableResult
    public func trailing(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return trailing(equalTo: .trailing, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    @discardableResult
    public func top(equalTo value: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .top, relatedBy: .equal, constant: value, priority: priority)
    }
    
    @discardableResult
    public func top(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .top, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    @discardableResult
    public func top(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return top(equalTo: .top, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    @discardableResult
    public func bottom(equalTo value: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .bottom, relatedBy: .equal, constant: value, priority: priority)
    }
    
    @discardableResult
    public func bottom(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .bottom, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    @discardableResult
    public func bottom(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return bottom(equalTo: .bottom, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    @discardableResult
    public func width(equalTo value: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .width, relatedBy: .equal, constant: value, priority: priority)
    }
    
    @discardableResult
    public func width(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .width, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    @discardableResult
    public func width(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return width(equalTo: .width, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    @discardableResult
    public func height(equalTo value: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .height, relatedBy: .equal, constant: value, priority: priority)
    }
    
    @discardableResult
    public func height(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .height, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)    }
    
    @discardableResult
    public func height(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return height(equalTo: .height, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
}
