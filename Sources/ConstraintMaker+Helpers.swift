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
    public func size(equalTo value: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return width(equalTo: value, at: priority).height(equalTo: value, at: priority)
    }
    
    @discardableResult
    public func size(equalTo value: CGSize, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return width(equalTo: value.width, at: priority).height(equalTo: value.height, at: priority)
    }
    
    @discardableResult
    public func size(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplier: CGFloat = 1, constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return width(equalTo: attribute, of: item2, multiplier: multiplier, constant: constant, at: priority)
            .height(equalTo: attribute, of: item2, multiplier: multiplier, constant: constant, at: priority)
    }
    
    @discardableResult
    public func size(equalTo item2: Item, multiplier: CGFloat = 1, constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return width(equalTo: .width, of: item2, multiplier: multiplier, constant: constant, at: priority)
            .height(equalTo: .height, of: item2, multiplier: multiplier, constant: constant, at: priority)
    }
    
    @discardableResult
    public func center(equalTo value: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerX(equalTo: value, at: priority).centerY(equalTo: value, at: priority)
    }
    
    @discardableResult
    public func center(equalTo value: CGPoint, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerX(equalTo: value.x, at: priority).centerY(equalTo: value.y, at: priority)
    }
    
    @discardableResult
    public func center(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplier: CGFloat = 1, constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerX(equalTo: attribute, of: item2, multiplier: multiplier, constant: constant, at: priority)
            .centerY(equalTo: attribute, of: item2, multiplier: multiplier, constant: constant, at: priority)
    }
    
    @discardableResult
    public func center(equalTo item2: Item, multiplier: CGFloat = 1, constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerX(equalTo: .centerX, of: item2, multiplier: multiplier, constant: constant, at: priority)
            .centerY(equalTo: .centerY, of: item2, multiplier: multiplier, constant: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    @discardableResult
    public func size(greaterThanOrEqualTo value: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return width(greaterThanOrEqualTo: value, at: priority).height(greaterThanOrEqualTo: value, at: priority)
    }
    
    @discardableResult
    public func size(greaterThanOrEqualTo value: CGSize, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return width(greaterThanOrEqualTo: value.width, at: priority).height(greaterThanOrEqualTo: value.height, at: priority)
    }
    
    @discardableResult
    public func size(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplier: CGFloat = 1, constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return width(greaterThanOrEqualTo: attribute, of: item2, multiplier: multiplier, constant: constant, at: priority)
            .height(greaterThanOrEqualTo: attribute, of: item2, multiplier: multiplier, constant: constant, at: priority)
    }
    
    @discardableResult
    public func size(greaterThanOrEqualTo item2: Item, multiplier: CGFloat = 1, constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return width(greaterThanOrEqualTo: .width, of: item2, multiplier: multiplier, constant: constant, at: priority)
            .height(greaterThanOrEqualTo: .height, of: item2, multiplier: multiplier, constant: constant, at: priority)
    }
    
    @discardableResult
    public func center(greaterThanOrEqualTo value: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerX(greaterThanOrEqualTo: value, at: priority).centerY(greaterThanOrEqualTo: value, at: priority)
    }
    
    @discardableResult
    public func center(greaterThanOrEqualTo value: CGPoint, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerX(greaterThanOrEqualTo: value.x, at: priority).centerY(greaterThanOrEqualTo: value.y, at: priority)
    }
    
    @discardableResult
    public func center(greaterThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplier: CGFloat = 1, constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerX(greaterThanOrEqualTo: attribute, of: item2, multiplier: multiplier, constant: constant, at: priority)
            .centerY(greaterThanOrEqualTo: attribute, of: item2, multiplier: multiplier, constant: constant, at: priority)
    }
    
    @discardableResult
    public func center(greaterThanOrEqualTo item2: Item, multiplier: CGFloat = 1, constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerX(greaterThanOrEqualTo: .centerX, of: item2, multiplier: multiplier, constant: constant, at: priority)
            .centerY(greaterThanOrEqualTo: .centerY, of: item2, multiplier: multiplier, constant: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    @discardableResult
    public func size(lessThanOrEqualTo value: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return width(lessThanOrEqualTo: value, at: priority).height(lessThanOrEqualTo: value, at: priority)
    }
    
    @discardableResult
    public func size(lessThanOrEqualTo value: CGSize, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return width(lessThanOrEqualTo: value.width, at: priority).height(lessThanOrEqualTo: value.height, at: priority)
    }
    
    @discardableResult
    public func size(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplier: CGFloat = 1, constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return width(lessThanOrEqualTo: attribute, of: item2, multiplier: multiplier, constant: constant, at: priority)
            .height(lessThanOrEqualTo: attribute, of: item2, multiplier: multiplier, constant: constant, at: priority)
    }
    
    @discardableResult
    public func size(lessThanOrEqualTo item2: Item, multiplier: CGFloat = 1, constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return width(lessThanOrEqualTo: .width, of: item2, multiplier: multiplier, constant: constant, at: priority)
            .height(lessThanOrEqualTo: .height, of: item2, multiplier: multiplier, constant: constant, at: priority)
    }
    
    @discardableResult
    public func center(lessThanOrEqualTo value: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerX(lessThanOrEqualTo: value, at: priority).centerY(lessThanOrEqualTo: value, at: priority)
    }
    
    @discardableResult
    public func center(lessThanOrEqualTo value: CGPoint, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerX(lessThanOrEqualTo: value.x, at: priority).centerY(lessThanOrEqualTo: value.y, at: priority)
    }
    
    @discardableResult
    public func center(lessThanOrEqualTo attribute: NSLayoutAttribute, of item2: Item, multiplier: CGFloat = 1, constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerX(lessThanOrEqualTo: attribute, of: item2, multiplier: multiplier, constant: constant, at: priority)
            .centerY(lessThanOrEqualTo: attribute, of: item2, multiplier: multiplier, constant: constant, at: priority)
    }
    
    @discardableResult
    public func center(lessThanOrEqualTo item2: Item, multiplier: CGFloat = 1, constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return centerX(lessThanOrEqualTo: .centerX, of: item2, multiplier: multiplier, constant: constant, at: priority)
            .centerY(lessThanOrEqualTo: .centerY, of: item2, multiplier: multiplier, constant: constant, at: priority)
    }
    
}
