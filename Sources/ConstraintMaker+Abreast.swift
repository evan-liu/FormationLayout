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

@available(iOS 7.0, *)
extension ConstraintMaker {
    
    /// Make item.top equalTo item2.bottom + constant
    @discardableResult
    public func below(_ item2: UILayoutSupport, gap constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .top, relatedBy: .equal, toItem: item2, attribute: .bottom, multiplier: 1, constant: constant, priority: priority)
    }
    
    /// Make item.bottom equalTo item2.top - constant
    @discardableResult
    public func above(_ item2: UILayoutSupport, gap constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return makeConstraint(attribute: .bottom, relatedBy: .equal, toItem: item2, attribute: .top, multiplier: 1, constant: -constant, priority: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.top equalTo item2.bottom + constant
    @discardableResult
    public func below(_ item2: Item, gap constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return top(equalTo: .bottom, of: item2, plus: constant, at: priority)
    }
    
    /// Make item.bottom equalTo item2.top - constant
    @discardableResult
    public func above(_ item2: Item, gap constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return bottom(equalTo: .top, of: item2, minus: constant, at: priority)
    }
    
}

extension ConstraintMaker {
    
    /// Make item.leading equalTo item2.trailing + constant
    @discardableResult
    public func after(_ item2: Item, gap constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return leading(equalTo: .trailing, of: item2, plus: constant, at: priority)
    }
    
    /// Make item.trailing equalTo item2.leading - constant
    @discardableResult
    public func before(_ item2: Item, gap constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return trailing(equalTo: .leading, of: item2, minus: constant, at: priority)
    }
    
}
