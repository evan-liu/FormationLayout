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
    func pinLeading(plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return leading(equalTo: item.superview ?? manager.rootView, multiplyBy: 1, plus: constant, at: priority)
    }
    
    @discardableResult
    func pinTrailing(plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return trailing(equalTo: item.superview ?? manager.rootView, multiplyBy: 1, plus: constant, at: priority)
    }
    
    @discardableResult
    func pinTop(plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return top(equalTo: item.superview ?? manager.rootView, multiplyBy: 1, plus: constant, at: priority)
    }
    
    @discardableResult
    func pinBottom(plus constant: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return bottom(equalTo: item.superview ?? manager.rootView, multiplyBy: 1, plus: constant, at: priority)
    }
    
    @discardableResult
    func fillWidth(multiplyBy multiplier: CGFloat = 1, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return width(equalTo: item.superview ?? manager.rootView, multiplyBy: multiplier, plus: 0, at: priority)
    }
    
    @discardableResult
    func fillHeight(multiplyBy multiplier: CGFloat = 1, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return height(equalTo: item.superview ?? manager.rootView, multiplyBy: multiplier, plus: 0, at: priority)
    }
    
}
