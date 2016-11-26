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

public final class GroupConstraintMaker: ConstraintMaker {
    
    private let items: [ItemConstraintMaker]
    init(items: [ItemConstraintMaker]) {
        self.items = items
    }
    
    public func makeConstraint(attribute: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, toItem item2: Any?, attribute attr2: NSLayoutAttribute, multiplier: CGFloat, constant c: CGFloat, priority: UILayoutPriority) -> Self {
        for item in items {
            item.makeConstraint(attribute: attribute, relatedBy: relation, toItem: item2, attribute: attr2, multiplier: multiplier, constant: c, priority: priority)
        }
        return self
    }
    
}

extension LayoutManager {
    
    public func group(_ items: Item...) -> GroupConstraintMaker {
        return GroupConstraintMaker(items: items.map { self[$0] } )
    }
    
}
