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

public final class ConstraintCondition: LayoutManager, ConstraintManager {
    
    private var _not: ConstraintCondition?
    public var not: LayoutManager {
        if let _not = _not { return _not }
        _not = ConstraintCondition(layout: self.layout, condition: { [unowned self] in
            return self.isMatched == false
        })
        return _not!
    }
    
    private var constraints = [NSLayoutConstraint]()
    private var isMatched: Bool? {
        didSet {
            guard isMatched != oldValue else { return }
            if isMatched == true {
                _not?.update()
                NSLayoutConstraint.activate(constraints)
            } else {
                NSLayoutConstraint.deactivate(constraints)
                _not?.update()
            }
        }
    }
    
    private let layout: FormationLayout
    private let condition: () -> Bool
    init(layout: FormationLayout, condition: @escaping () -> Bool) {
        self.layout = layout
        self.condition = condition
    }
    
    public subscript(item: Item) -> ItemConstraintMaker {
        return layout.constraintMaker(for: item, manager: self)
    }
    
    func add(_ constraint: NSLayoutConstraint) -> NSLayoutConstraint {
        constraints.append(constraint)
        return constraint
    }
    
    func update() {
        isMatched = condition()
    }
    
}
