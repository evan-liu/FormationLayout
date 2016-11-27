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
    
    /// Make item.left equalTo item2.attribute * multiplier + constant
    @discardableResult
    public func left(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .left, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.left equalTo item2.left * multiplier + constant
    @discardableResult
    public func left(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return left(equalTo: .left, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.left equalTo item2.attribute * multiplier - constant
    @discardableResult
    public func left(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .left, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.left equalTo item2.left * multiplier - constant
    @discardableResult
    public func left(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return left(equalTo: .left, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.right equalTo item2.attribute * multiplier + constant
    @discardableResult
    public func right(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .right, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.right equalTo item2.right * multiplier + constant
    @discardableResult
    public func right(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return right(equalTo: .right, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.right equalTo item2.attribute * multiplier - constant
    @discardableResult
    public func right(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .right, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.right equalTo item2.right * multiplier - constant
    @discardableResult
    public func right(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return right(equalTo: .right, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.top equalTo item2.attribute * multiplier + constant
    @discardableResult
    public func top(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .top, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.top equalTo item2.top * multiplier + constant
    @discardableResult
    public func top(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return top(equalTo: .top, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.top equalTo item2.attribute * multiplier - constant
    @discardableResult
    public func top(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .top, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.top equalTo item2.top * multiplier - constant
    @discardableResult
    public func top(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return top(equalTo: .top, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.bottom equalTo item2.attribute * multiplier + constant
    @discardableResult
    public func bottom(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .bottom, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.bottom equalTo item2.bottom * multiplier + constant
    @discardableResult
    public func bottom(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return bottom(equalTo: .bottom, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.bottom equalTo item2.attribute * multiplier - constant
    @discardableResult
    public func bottom(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .bottom, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.bottom equalTo item2.bottom * multiplier - constant
    @discardableResult
    public func bottom(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return bottom(equalTo: .bottom, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.leading equalTo item2.attribute * multiplier + constant
    @discardableResult
    public func leading(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .leading, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.leading equalTo item2.leading * multiplier + constant
    @discardableResult
    public func leading(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return leading(equalTo: .leading, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.leading equalTo item2.attribute * multiplier - constant
    @discardableResult
    public func leading(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .leading, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.leading equalTo item2.leading * multiplier - constant
    @discardableResult
    public func leading(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return leading(equalTo: .leading, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.trailing equalTo item2.attribute * multiplier + constant
    @discardableResult
    public func trailing(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .trailing, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.trailing equalTo item2.trailing * multiplier + constant
    @discardableResult
    public func trailing(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return trailing(equalTo: .trailing, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.trailing equalTo item2.attribute * multiplier - constant
    @discardableResult
    public func trailing(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .trailing, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.trailing equalTo item2.trailing * multiplier - constant
    @discardableResult
    public func trailing(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return trailing(equalTo: .trailing, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.width equalTo item2.attribute * multiplier + constant
    @discardableResult
    public func width(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .width, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.width equalTo item2.width * multiplier + constant
    @discardableResult
    public func width(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return width(equalTo: .width, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.width equalTo item2.attribute * multiplier - constant
    @discardableResult
    public func width(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .width, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.width equalTo item2.width * multiplier - constant
    @discardableResult
    public func width(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return width(equalTo: .width, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.height equalTo item2.attribute * multiplier + constant
    @discardableResult
    public func height(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .height, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.height equalTo item2.height * multiplier + constant
    @discardableResult
    public func height(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return height(equalTo: .height, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.height equalTo item2.attribute * multiplier - constant
    @discardableResult
    public func height(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .height, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.height equalTo item2.height * multiplier - constant
    @discardableResult
    public func height(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return height(equalTo: .height, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.centerX equalTo item2.attribute * multiplier + constant
    @discardableResult
    public func centerX(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .centerX, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.centerX equalTo item2.centerX * multiplier + constant
    @discardableResult
    public func centerX(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerX(equalTo: .centerX, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.centerX equalTo item2.attribute * multiplier - constant
    @discardableResult
    public func centerX(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .centerX, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.centerX equalTo item2.centerX * multiplier - constant
    @discardableResult
    public func centerX(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerX(equalTo: .centerX, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.centerY equalTo item2.attribute * multiplier + constant
    @discardableResult
    public func centerY(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .centerY, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.centerY equalTo item2.centerY * multiplier + constant
    @discardableResult
    public func centerY(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerY(equalTo: .centerY, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.centerY equalTo item2.attribute * multiplier - constant
    @discardableResult
    public func centerY(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .centerY, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.centerY equalTo item2.centerY * multiplier - constant
    @discardableResult
    public func centerY(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerY(equalTo: .centerY, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.lastBaseline equalTo item2.attribute * multiplier + constant
    @discardableResult
    public func lastBaseline(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .lastBaseline, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.lastBaseline equalTo item2.lastBaseline * multiplier + constant
    @discardableResult
    public func lastBaseline(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return lastBaseline(equalTo: .lastBaseline, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.lastBaseline equalTo item2.attribute * multiplier - constant
    @discardableResult
    public func lastBaseline(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .lastBaseline, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.lastBaseline equalTo item2.lastBaseline * multiplier - constant
    @discardableResult
    public func lastBaseline(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return lastBaseline(equalTo: .lastBaseline, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.firstBaseline equalTo item2.attribute * multiplier + constant
    @discardableResult
    public func firstBaseline(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .firstBaseline, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.firstBaseline equalTo item2.firstBaseline * multiplier + constant
    @discardableResult
    public func firstBaseline(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return firstBaseline(equalTo: .firstBaseline, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.firstBaseline equalTo item2.attribute * multiplier - constant
    @discardableResult
    public func firstBaseline(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .firstBaseline, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.firstBaseline equalTo item2.firstBaseline * multiplier - constant
    @discardableResult
    public func firstBaseline(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return firstBaseline(equalTo: .firstBaseline, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.centerXWithinMargins equalTo item2.attribute * multiplier + constant
    @discardableResult
    public func centerXWithinMargins(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .centerXWithinMargins, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.centerXWithinMargins equalTo item2.centerXWithinMargins * multiplier + constant
    @discardableResult
    public func centerXWithinMargins(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerXWithinMargins(equalTo: .centerXWithinMargins, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.centerXWithinMargins equalTo item2.attribute * multiplier - constant
    @discardableResult
    public func centerXWithinMargins(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .centerXWithinMargins, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.centerXWithinMargins equalTo item2.centerXWithinMargins * multiplier - constant
    @discardableResult
    public func centerXWithinMargins(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerXWithinMargins(equalTo: .centerXWithinMargins, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.centerYWithinMargins equalTo item2.attribute * multiplier + constant
    @discardableResult
    public func centerYWithinMargins(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .centerYWithinMargins, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.centerYWithinMargins equalTo item2.centerYWithinMargins * multiplier + constant
    @discardableResult
    public func centerYWithinMargins(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerYWithinMargins(equalTo: .centerYWithinMargins, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.centerYWithinMargins equalTo item2.attribute * multiplier - constant
    @discardableResult
    public func centerYWithinMargins(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .centerYWithinMargins, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.centerYWithinMargins equalTo item2.centerYWithinMargins * multiplier - constant
    @discardableResult
    public func centerYWithinMargins(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerYWithinMargins(equalTo: .centerYWithinMargins, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.left greaterThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func left(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .left, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.left greaterThanOrEqualTo item2.left * multiplier + constant
    @discardableResult
    public func left(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return left(greaterThanOrEqualTo: .left, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.left greaterThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func left(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .left, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.left greaterThanOrEqualTo item2.left * multiplier - constant
    @discardableResult
    public func left(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return left(greaterThanOrEqualTo: .left, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.right greaterThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func right(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .right, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.right greaterThanOrEqualTo item2.right * multiplier + constant
    @discardableResult
    public func right(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return right(greaterThanOrEqualTo: .right, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.right greaterThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func right(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .right, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.right greaterThanOrEqualTo item2.right * multiplier - constant
    @discardableResult
    public func right(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return right(greaterThanOrEqualTo: .right, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.top greaterThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func top(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .top, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.top greaterThanOrEqualTo item2.top * multiplier + constant
    @discardableResult
    public func top(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return top(greaterThanOrEqualTo: .top, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.top greaterThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func top(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .top, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.top greaterThanOrEqualTo item2.top * multiplier - constant
    @discardableResult
    public func top(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return top(greaterThanOrEqualTo: .top, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.bottom greaterThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func bottom(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .bottom, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.bottom greaterThanOrEqualTo item2.bottom * multiplier + constant
    @discardableResult
    public func bottom(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return bottom(greaterThanOrEqualTo: .bottom, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.bottom greaterThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func bottom(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .bottom, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.bottom greaterThanOrEqualTo item2.bottom * multiplier - constant
    @discardableResult
    public func bottom(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return bottom(greaterThanOrEqualTo: .bottom, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.leading greaterThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func leading(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .leading, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.leading greaterThanOrEqualTo item2.leading * multiplier + constant
    @discardableResult
    public func leading(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return leading(greaterThanOrEqualTo: .leading, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.leading greaterThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func leading(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .leading, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.leading greaterThanOrEqualTo item2.leading * multiplier - constant
    @discardableResult
    public func leading(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return leading(greaterThanOrEqualTo: .leading, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.trailing greaterThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func trailing(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .trailing, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.trailing greaterThanOrEqualTo item2.trailing * multiplier + constant
    @discardableResult
    public func trailing(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return trailing(greaterThanOrEqualTo: .trailing, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.trailing greaterThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func trailing(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .trailing, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.trailing greaterThanOrEqualTo item2.trailing * multiplier - constant
    @discardableResult
    public func trailing(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return trailing(greaterThanOrEqualTo: .trailing, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.width greaterThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func width(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .width, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.width greaterThanOrEqualTo item2.width * multiplier + constant
    @discardableResult
    public func width(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return width(greaterThanOrEqualTo: .width, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.width greaterThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func width(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .width, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.width greaterThanOrEqualTo item2.width * multiplier - constant
    @discardableResult
    public func width(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return width(greaterThanOrEqualTo: .width, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.height greaterThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func height(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .height, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.height greaterThanOrEqualTo item2.height * multiplier + constant
    @discardableResult
    public func height(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return height(greaterThanOrEqualTo: .height, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.height greaterThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func height(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .height, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.height greaterThanOrEqualTo item2.height * multiplier - constant
    @discardableResult
    public func height(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return height(greaterThanOrEqualTo: .height, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.centerX greaterThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func centerX(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .centerX, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.centerX greaterThanOrEqualTo item2.centerX * multiplier + constant
    @discardableResult
    public func centerX(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerX(greaterThanOrEqualTo: .centerX, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.centerX greaterThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func centerX(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .centerX, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.centerX greaterThanOrEqualTo item2.centerX * multiplier - constant
    @discardableResult
    public func centerX(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerX(greaterThanOrEqualTo: .centerX, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.centerY greaterThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func centerY(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .centerY, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.centerY greaterThanOrEqualTo item2.centerY * multiplier + constant
    @discardableResult
    public func centerY(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerY(greaterThanOrEqualTo: .centerY, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.centerY greaterThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func centerY(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .centerY, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.centerY greaterThanOrEqualTo item2.centerY * multiplier - constant
    @discardableResult
    public func centerY(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerY(greaterThanOrEqualTo: .centerY, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.lastBaseline greaterThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func lastBaseline(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .lastBaseline, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.lastBaseline greaterThanOrEqualTo item2.lastBaseline * multiplier + constant
    @discardableResult
    public func lastBaseline(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return lastBaseline(greaterThanOrEqualTo: .lastBaseline, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.lastBaseline greaterThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func lastBaseline(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .lastBaseline, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.lastBaseline greaterThanOrEqualTo item2.lastBaseline * multiplier - constant
    @discardableResult
    public func lastBaseline(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return lastBaseline(greaterThanOrEqualTo: .lastBaseline, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.firstBaseline greaterThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func firstBaseline(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .firstBaseline, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.firstBaseline greaterThanOrEqualTo item2.firstBaseline * multiplier + constant
    @discardableResult
    public func firstBaseline(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return firstBaseline(greaterThanOrEqualTo: .firstBaseline, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.firstBaseline greaterThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func firstBaseline(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .firstBaseline, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.firstBaseline greaterThanOrEqualTo item2.firstBaseline * multiplier - constant
    @discardableResult
    public func firstBaseline(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return firstBaseline(greaterThanOrEqualTo: .firstBaseline, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.centerXWithinMargins greaterThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func centerXWithinMargins(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .centerXWithinMargins, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.centerXWithinMargins greaterThanOrEqualTo item2.centerXWithinMargins * multiplier + constant
    @discardableResult
    public func centerXWithinMargins(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerXWithinMargins(greaterThanOrEqualTo: .centerXWithinMargins, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.centerXWithinMargins greaterThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func centerXWithinMargins(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .centerXWithinMargins, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.centerXWithinMargins greaterThanOrEqualTo item2.centerXWithinMargins * multiplier - constant
    @discardableResult
    public func centerXWithinMargins(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerXWithinMargins(greaterThanOrEqualTo: .centerXWithinMargins, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.centerYWithinMargins greaterThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func centerYWithinMargins(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .centerYWithinMargins, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.centerYWithinMargins greaterThanOrEqualTo item2.centerYWithinMargins * multiplier + constant
    @discardableResult
    public func centerYWithinMargins(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerYWithinMargins(greaterThanOrEqualTo: .centerYWithinMargins, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.centerYWithinMargins greaterThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func centerYWithinMargins(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .centerYWithinMargins, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.centerYWithinMargins greaterThanOrEqualTo item2.centerYWithinMargins * multiplier - constant
    @discardableResult
    public func centerYWithinMargins(greaterThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerYWithinMargins(greaterThanOrEqualTo: .centerYWithinMargins, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.left lessThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func left(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .left, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.left lessThanOrEqualTo item2.left * multiplier + constant
    @discardableResult
    public func left(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return left(lessThanOrEqualTo: .left, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.left lessThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func left(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .left, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.left lessThanOrEqualTo item2.left * multiplier - constant
    @discardableResult
    public func left(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return left(lessThanOrEqualTo: .left, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.right lessThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func right(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .right, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.right lessThanOrEqualTo item2.right * multiplier + constant
    @discardableResult
    public func right(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return right(lessThanOrEqualTo: .right, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.right lessThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func right(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .right, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.right lessThanOrEqualTo item2.right * multiplier - constant
    @discardableResult
    public func right(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return right(lessThanOrEqualTo: .right, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.top lessThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func top(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .top, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.top lessThanOrEqualTo item2.top * multiplier + constant
    @discardableResult
    public func top(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return top(lessThanOrEqualTo: .top, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.top lessThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func top(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .top, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.top lessThanOrEqualTo item2.top * multiplier - constant
    @discardableResult
    public func top(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return top(lessThanOrEqualTo: .top, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.bottom lessThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func bottom(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .bottom, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.bottom lessThanOrEqualTo item2.bottom * multiplier + constant
    @discardableResult
    public func bottom(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return bottom(lessThanOrEqualTo: .bottom, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.bottom lessThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func bottom(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .bottom, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.bottom lessThanOrEqualTo item2.bottom * multiplier - constant
    @discardableResult
    public func bottom(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return bottom(lessThanOrEqualTo: .bottom, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.leading lessThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func leading(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .leading, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.leading lessThanOrEqualTo item2.leading * multiplier + constant
    @discardableResult
    public func leading(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return leading(lessThanOrEqualTo: .leading, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.leading lessThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func leading(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .leading, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.leading lessThanOrEqualTo item2.leading * multiplier - constant
    @discardableResult
    public func leading(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return leading(lessThanOrEqualTo: .leading, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.trailing lessThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func trailing(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .trailing, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.trailing lessThanOrEqualTo item2.trailing * multiplier + constant
    @discardableResult
    public func trailing(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return trailing(lessThanOrEqualTo: .trailing, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.trailing lessThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func trailing(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .trailing, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.trailing lessThanOrEqualTo item2.trailing * multiplier - constant
    @discardableResult
    public func trailing(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return trailing(lessThanOrEqualTo: .trailing, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.width lessThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func width(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .width, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.width lessThanOrEqualTo item2.width * multiplier + constant
    @discardableResult
    public func width(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return width(lessThanOrEqualTo: .width, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.width lessThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func width(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .width, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.width lessThanOrEqualTo item2.width * multiplier - constant
    @discardableResult
    public func width(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return width(lessThanOrEqualTo: .width, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.height lessThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func height(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .height, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.height lessThanOrEqualTo item2.height * multiplier + constant
    @discardableResult
    public func height(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return height(lessThanOrEqualTo: .height, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.height lessThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func height(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .height, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.height lessThanOrEqualTo item2.height * multiplier - constant
    @discardableResult
    public func height(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return height(lessThanOrEqualTo: .height, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.centerX lessThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func centerX(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .centerX, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.centerX lessThanOrEqualTo item2.centerX * multiplier + constant
    @discardableResult
    public func centerX(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerX(lessThanOrEqualTo: .centerX, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.centerX lessThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func centerX(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .centerX, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.centerX lessThanOrEqualTo item2.centerX * multiplier - constant
    @discardableResult
    public func centerX(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerX(lessThanOrEqualTo: .centerX, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.centerY lessThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func centerY(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .centerY, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.centerY lessThanOrEqualTo item2.centerY * multiplier + constant
    @discardableResult
    public func centerY(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerY(lessThanOrEqualTo: .centerY, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.centerY lessThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func centerY(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .centerY, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.centerY lessThanOrEqualTo item2.centerY * multiplier - constant
    @discardableResult
    public func centerY(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerY(lessThanOrEqualTo: .centerY, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.lastBaseline lessThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func lastBaseline(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .lastBaseline, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.lastBaseline lessThanOrEqualTo item2.lastBaseline * multiplier + constant
    @discardableResult
    public func lastBaseline(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return lastBaseline(lessThanOrEqualTo: .lastBaseline, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.lastBaseline lessThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func lastBaseline(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .lastBaseline, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.lastBaseline lessThanOrEqualTo item2.lastBaseline * multiplier - constant
    @discardableResult
    public func lastBaseline(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return lastBaseline(lessThanOrEqualTo: .lastBaseline, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.firstBaseline lessThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func firstBaseline(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .firstBaseline, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.firstBaseline lessThanOrEqualTo item2.firstBaseline * multiplier + constant
    @discardableResult
    public func firstBaseline(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return firstBaseline(lessThanOrEqualTo: .firstBaseline, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.firstBaseline lessThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func firstBaseline(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .firstBaseline, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.firstBaseline lessThanOrEqualTo item2.firstBaseline * multiplier - constant
    @discardableResult
    public func firstBaseline(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return firstBaseline(lessThanOrEqualTo: .firstBaseline, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.centerXWithinMargins lessThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func centerXWithinMargins(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .centerXWithinMargins, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.centerXWithinMargins lessThanOrEqualTo item2.centerXWithinMargins * multiplier + constant
    @discardableResult
    public func centerXWithinMargins(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerXWithinMargins(lessThanOrEqualTo: .centerXWithinMargins, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.centerXWithinMargins lessThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func centerXWithinMargins(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .centerXWithinMargins, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.centerXWithinMargins lessThanOrEqualTo item2.centerXWithinMargins * multiplier - constant
    @discardableResult
    public func centerXWithinMargins(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerXWithinMargins(lessThanOrEqualTo: .centerXWithinMargins, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.centerYWithinMargins lessThanOrEqualTo item2.attribute * multiplier + constant
    @discardableResult
    public func centerYWithinMargins(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .centerYWithinMargins, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Make item.centerYWithinMargins lessThanOrEqualTo item2.centerYWithinMargins * multiplier + constant
    @discardableResult
    public func centerYWithinMargins(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerYWithinMargins(lessThanOrEqualTo: .centerYWithinMargins, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
    /// Make item.centerYWithinMargins lessThanOrEqualTo item2.attribute * multiplier - constant
    @discardableResult
    public func centerYWithinMargins(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .centerYWithinMargins, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: -constant, priority: priority)
    }
    
    /// Make item.centerYWithinMargins lessThanOrEqualTo item2.centerYWithinMargins * multiplier - constant
    @discardableResult
    public func centerYWithinMargins(lessThanOrEqualTo item2: Item, multiplyBy multiplier: CGFloat = 1, minus constant: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerYWithinMargins(lessThanOrEqualTo: .centerYWithinMargins, of: item2, multiplyBy: multiplier, minus: constant, at: priority)
    }
    
}