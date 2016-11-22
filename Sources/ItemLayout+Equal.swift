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

extension ItemLayout {
    
    @discardableResult
    func leading(equalTo value: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        manager.add(item: item, attribute: .leading, constant: value).priority = priority
        return self
    }
    
    @discardableResult
    func leading(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        manager.add(NSLayoutConstraint(item: item, attribute: .leading, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant)).priority = priority
        return self
    }
    
    @discardableResult
    func leading(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return leading(equalTo: .leading, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
}

extension ItemLayout {
    
    @discardableResult
    func trailing(equalTo value: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        manager.add(item: item, attribute: .trailing, constant: value).priority = priority
        return self
    }
    
    @discardableResult
    func trailing(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        manager.add(NSLayoutConstraint(item: item, attribute: .trailing, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant)).priority = priority
        return self
    }
    
    @discardableResult
    func trailing(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return trailing(equalTo: .trailing, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
}

extension ItemLayout {
    
    @discardableResult
    func top(equalTo value: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        manager.add(item: item, attribute: .top, constant: value).priority = priority
        return self
    }
    
    @discardableResult
    func top(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        manager.add(NSLayoutConstraint(item: item, attribute: .top, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant)).priority = priority
        return self
    }
    
    @discardableResult
    func top(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return top(equalTo: .top, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
}

extension ItemLayout {
    
    @discardableResult
    func bottom(equalTo value: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        manager.add(item: item, attribute: .bottom, constant: value).priority = priority
        return self
    }
    
    @discardableResult
    func bottom(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        manager.add(NSLayoutConstraint(item: item, attribute: .bottom, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant)).priority = priority
        return self
    }
    
    @discardableResult
    func bottom(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return bottom(equalTo: .bottom, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
}

extension ItemLayout {
    
    @discardableResult
    func width(equalTo value: CGFloat, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        manager.add(item: item, attribute: .width, constant: value).priority = priority
        return self
    }
    
    @discardableResult
    func width(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        manager.add(NSLayoutConstraint(item: item, attribute: .width, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant)).priority = priority
        return self
    }
    
    @discardableResult
    func width(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return width(equalTo: .width, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
}

extension ItemLayout {
    
    @discardableResult
    func height(equalTo value: CGFloat) -> Self {
        manager.add(item: item, attribute: .height, constant: value)
        return self
    }
    
    @discardableResult
    func height(equalTo attribute: NSLayoutAttribute, of item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        manager.add(NSLayoutConstraint(item: item, attribute: .height, relatedBy: .equal, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant)).priority = priority
        return self
    }
    
    @discardableResult
    func height(equalTo item2: Item, multiplyBy multiplier: CGFloat = 1, plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return height(equalTo: .height, of: item2, multiplyBy: multiplier, plus: constant, at: priority)
    }
    
}
