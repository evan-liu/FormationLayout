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
    public func pin(to item2: UIView, margin: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return left(equalTo: item2, constant: margin, at: priority)
            .right(equalTo: item2, constant: margin, at: priority)
            .top(equalTo: item2, constant: margin, at: priority)
            .bottom(equalTo: item2, constant: margin, at: priority)
    }
    
    @discardableResult
    public func pin(to item2: UIView, margin: UIEdgeInsets, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return left(equalTo: item2, constant: margin.left, at: priority)
            .top(equalTo: item2, constant: margin.top, at: priority)
            .right(equalTo: item2, constant: -margin.right, at: priority)
            .bottom(equalTo: item2, constant: -margin.bottom, at: priority)
    }
    
}
