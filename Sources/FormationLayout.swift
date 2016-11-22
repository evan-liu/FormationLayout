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

public final class FormationLayout {
    
    public let rootView: UIView
    
    public init(rootView: UIView, translatesAutoresizing: Bool = false, autoresizing: UIViewAutoresizing? = nil) {
        rootView.translatesAutoresizingMaskIntoConstraints = translatesAutoresizing
        if translatesAutoresizing, let autoresizingMask = autoresizing {
            rootView.autoresizingMask = autoresizingMask
        }
        self.rootView = rootView
    }
    
    public subscript(item: Item) -> ItemLayout {
        if item !== rootView {
            item.prepareAutoLayout(in: rootView)
        }
        return ItemLayout(item: item, manager: self)
    }
    
}

protocol ConstraintsManager {
    
    var rootView: UIView { get }
    
    @discardableResult
    func add(_ constraint: NSLayoutConstraint) -> NSLayoutConstraint
}

extension FormationLayout: ConstraintsManager {
    @discardableResult
    func add(_ constraint: NSLayoutConstraint) -> NSLayoutConstraint {
        constraint.isActive = true
        return constraint
    }
}

extension ConstraintsManager {
    @discardableResult
    func add(item: Any, attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation = .equal, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        return add(NSLayoutConstraint(item: item, attribute: attribute, relatedBy: relation, toItem: nil, attribute: .notAnAttribute, multiplier: multiplier, constant: constant))
    }
}
