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

public protocol Item: class {
    
    func prepareAutoLayout(in rootView: UIView)
}

extension View: Item {
    public func prepareAutoLayout(in rootView: View) {
        translatesAutoresizingMaskIntoConstraints = false
        if superview == nil && rootView !== self {
            rootView.addSubview(self)
        }
    }
}

public final class ItemConstraintMaker: ConstraintMaker {
    
    let item: Item
    let manager: ConstraintManager
    
    init(item: Item, manager: ConstraintManager) {
        self.item = item
        self.manager = manager
    }
    
    public func makeConstraint(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, toItem item2: Any? = nil, attribute attr2: NSLayoutAttribute = .notAnAttribute, multiplier: CGFloat = 1, constant c: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        manager.add(NSLayoutConstraint(item: item, attribute: attribute, relatedBy: relation, toItem: item2, attribute: attr2, multiplier: multiplier, constant: c)).priority = priority
        return self
    }
    
}
