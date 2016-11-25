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

public typealias View = UIView

public final class FormationLayout {
    
    public let rootView: View
    
    public init(rootView: View, translatesAutoresizing: Bool = false, autoresizing: UIViewAutoresizing? = nil) {
        rootView.translatesAutoresizingMaskIntoConstraints = translatesAutoresizing
        if translatesAutoresizing, let autoresizingMask = autoresizing {
            rootView.autoresizingMask = autoresizingMask
        }
        self.rootView = rootView
    }
    
    public subscript(item: Item) -> ItemConstraintMaker {
        if item !== rootView {
            item.prepareAutoLayout(in: rootView)
        }
        return ItemConstraintMaker(item: item, manager: self)
    }
    
}

extension FormationLayout: ConstraintManager {
    @discardableResult
    func add(_ constraint: NSLayoutConstraint) -> NSLayoutConstraint {
        constraint.isActive = true
        return constraint
    }
}
