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

public struct PinEdges: OptionSet, Hashable {
    
    public static let left = PinEdges(rawValue: 1 << 0)
    public static let right = PinEdges(rawValue: 1 << 1)
    
    public static let top = PinEdges(rawValue: 1 << 2)
    public static let bottom = PinEdges(rawValue: 1 << 3)
    
    public static let leading = PinEdges(rawValue: 1 << 4)
    public static let trailing = PinEdges(rawValue: 1 << 5)
    
    public static let leftRight: PinEdges = [.left, .right]
    public static let topBottom: PinEdges = [.top, .bottom]
    public static let leadingTrailing: PinEdges = [.leading, .trailing]
    
    public static let topFill: PinEdges = [.top, .leftRight]
    public static let bottomFill: PinEdges = [.bottom, .leftRight]
    public static let leftFill: PinEdges = [.left, .topBottom]
    public static let rightFill: PinEdges = [.right, .topBottom]
    public static let leadingFill: PinEdges = [.leading, .topBottom]
    public static let trailingFill: PinEdges = [.trailing, .topBottom]
    
    public let rawValue: Int
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public var hashValue: Int {
        return rawValue.hashValue
    }
    
}

extension ConstraintMaker {
    
    @discardableResult
    public func pin(to item2: Item, margin: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return left(equalTo: item2, plus: margin, at: priority)
            .right(equalTo: item2, minus: margin, at: priority)
            .top(equalTo: item2, plus: margin, at: priority)
            .bottom(equalTo: item2, minus: margin, at: priority)
    }
    
    @discardableResult
    public func pin(to item2: Item, margin: UIEdgeInsets, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        return left(equalTo: item2, plus: margin.left, at: priority)
            .right(equalTo: item2, minus: margin.right, at: priority)
            .top(equalTo: item2, plus: margin.top, at: priority)
            .bottom(equalTo: item2, minus: margin.bottom, at: priority)
    }
    
    @discardableResult
    public func pin(to item2: Item, edges: PinEdges, margin: CGFloat = 0, at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        if edges.contains(.left) {
            left(equalTo: item2, plus: margin, at: priority)
        }
        if edges.contains(.right) {
            right(equalTo: item2, minus: margin, at: priority)
        }
        if edges.contains(.top) {
            top(equalTo: item2, plus: margin, at: priority)
        }
        if edges.contains(.bottom) {
            bottom(equalTo: item2, minus: margin, at: priority)
        }
        if edges.contains(.leading) {
            leading(equalTo: item2, plus: margin, at: priority)
        }
        if edges.contains(.trailing) {
            trailing(equalTo: item2, minus: margin, at: priority)
        }
        return self
    }
    
    @discardableResult
    public func pin(to item2: Item, edgesWithMargin: [PinEdges: CGFloat], at priority: UILayoutPriority = UILayoutPriorityRequired) -> Self {
        for (edges, margin) in edgesWithMargin {
            pin(to: item2, edges: edges, margin: margin, at: priority)
        }
        return self
    }
    
}
