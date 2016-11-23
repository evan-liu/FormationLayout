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
    public func pinLeading(plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return pinConstraint(attribute: .leading, relatedBy: .equal, attribute: .leading, multiplier: 1, constant: constant, priority: priority)
    }
    
    @discardableResult
    public func pinTrailing(plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return pinConstraint(attribute: .trailing, relatedBy: .equal, attribute: .trailing, multiplier: 1, constant: constant, priority: priority)
    }
    
    @discardableResult
    public func pinTop(plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return pinConstraint(attribute: .top, relatedBy: .equal, attribute: .top, multiplier: 1, constant: constant, priority: priority)
    }
    
    @discardableResult
    public func pinBottom(plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return pinConstraint(attribute: .bottom, relatedBy: .equal, attribute: .bottom, multiplier: 1, constant: constant, priority: priority)
    }
    
    @discardableResult
    public func fillWidth(multiplyBy multiplier: CGFloat = 1, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return pinConstraint(attribute: .width, relatedBy: .equal, attribute: .width, multiplier: multiplier, constant: 0, priority: priority)
    }
    
    @discardableResult
    public func fillHeight(multiplyBy multiplier: CGFloat = 1, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return pinConstraint(attribute: .height, relatedBy: .equal, attribute: .height, multiplier: multiplier, constant: 0, priority: priority)
    }
    
}
