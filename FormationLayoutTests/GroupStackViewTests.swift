//
//  GroupStackViewTests.swift
//  FormationLayout
//
//  Created by Evan on 1/07/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class GroupStackViewTests: XCTestCase {
    var stack: GroupStackView!
    
    var v1: UIView!
    var v2: UIView!
    var v3: UIView!
    
    override func setUp() {
        stack = GroupStackView()
        class InStackView: UIView {
            private override func intrinsicContentSize() -> CGSize {
                return CGSizeMake(10, 10)
            }
        }
        v1 = InStackView()
        v2 = InStackView()
        v3 = InStackView()
    }
    
    func testArrangedSubviews() {
        stack.arrangedSubviews = [v1, v2, v3]
        XCTAssertEqual(stack.arrangedSubviews, [v1, v2, v3])
    }
    
    // addArrangedSubview()
    func testAddArrangedSubview() {
        // should add view to arrangedSubviews
        
        stack.addArrangedSubview(v1)
        XCTAssertEqual(stack.arrangedSubviews, [v1])
        
        stack.addArrangedSubview(v2)
        XCTAssertEqual(stack.arrangedSubviews, [v1, v2])
        
        stack.addArrangedSubview(v3)
        XCTAssertEqual(stack.arrangedSubviews, [v1, v2, v3])

        // should ignore exist views
        
        stack.addArrangedSubview(v1)
        stack.addArrangedSubview(v2)
        stack.addArrangedSubview(v3)
        XCTAssertEqual(stack.arrangedSubviews, [v1, v2, v3])
    }
    
    // insertArrangedSubview()
    func testInsertArrangedSubview() {
        // should insert views to the index
        
        stack.insertArrangedSubview(v1, atIndex: 0)
        XCTAssertEqual(stack.arrangedSubviews, [v1])
        
        stack.insertArrangedSubview(v2, atIndex: 0)
        XCTAssertEqual(stack.arrangedSubviews, [v2, v1])
        
        stack.insertArrangedSubview(v3, atIndex: 1)
        XCTAssertEqual(stack.arrangedSubviews, [v2, v3, v1])

        stack.insertArrangedSubview(v1, atIndex: 1)
        stack.insertArrangedSubview(v2, atIndex: 1)
        stack.insertArrangedSubview(v3, atIndex: 1)
        XCTAssertEqual(stack.arrangedSubviews, [v2, v3, v1])
        
    }
    
    // removeArrangedSubview()
    func testRemoveArrangedSubview() {
        // should remove views from arrangedSubviews
        
        stack.arrangedSubviews = [v1, v2, v3]
        
        stack.removeArrangedSubview(v2)
        XCTAssertEqual(stack.arrangedSubviews, [v1, v3])
        
        stack.removeArrangedSubview(v1)
        stack.removeArrangedSubview(v2)
        stack.removeArrangedSubview(v3)
        XCTAssertEqual(stack.arrangedSubviews, [])
    }
    
    func testLayout() {
        func constraint(v1: AnyObject, _ attr1: NSLayoutAttribute, _ relation: NSLayoutRelation, _ v2: AnyObject, _ attr2: NSLayoutAttribute, _ c: CGFloat = 0, _ m: CGFloat = 1, _ p: Float = 1000) -> NSLayoutConstraint {
            let r = NSLayoutConstraint(item: v1, attribute: attr1, relatedBy: relation, toItem: v2, attribute: attr2, multiplier: m, constant: c)
            r.priority = p
            return r
        }
        func equal(c1: NSLayoutConstraint, _ c2: NSLayoutConstraint) -> Bool {
            return (c1.firstItem as! View).isEqualTo(c2.firstItem as! View)
                && c1.firstAttribute == c2.firstAttribute
                && (c1.secondItem as! View).isEqualTo(c2.secondItem as! View)
                && c1.secondAttribute == c2.secondAttribute
                && c1.relation == c2.relation
                && c1.constant == c2.constant
                && c1.priority == c2.priority
        }
        func indexOf(a: [NSLayoutConstraint], _ c: NSLayoutConstraint) -> Int {
            for i in 0 ..< a.count {
                if equal(c, a[i]) {
                    return i
                }
            }
            return -1
        }
        func checkConstraints(a1:[NSLayoutConstraint], _ a2: [NSLayoutConstraint]) -> Bool {
            if a1.count != a2.count {
                return false
            }
            
            var toCheck = a1
            for c2 in a2 {
                let index = indexOf(toCheck, c2)
                if index > -1 {
                    toCheck.removeAtIndex(index)
                } else {
                    print("---------- 2")
                    print(c2)
                }
            }
            
            if toCheck.count > 0 {
                for c1 in toCheck {
                    print("========== 1")
                    print(c1)
                }
            }
            
            return toCheck.count == 0
        }
        
        stack.arrangedSubviews = [v1, v2, v3]
    
        // H_Fill_Fill_0_false
        stack.layoutIfNeeded()
        XCTAssert(checkConstraints(stack.constraints, [
            //-- Pin first and last
            constraint(v1, .Leading, .Equal, stack, .Leading),
            constraint(v3, .Trailing, .Equal, stack, .Trailing),
            //-- align
            constraint(v1, .Top, .Equal, stack, .Top),
            constraint(v2, .Top, .Equal, stack, .Top),
            constraint(v3, .Top, .Equal, stack, .Top),
            constraint(v1, .Bottom, .Equal, stack, .Bottom),
            constraint(v2, .Bottom, .Equal, stack, .Bottom),
            constraint(v3, .Bottom, .Equal, stack, .Bottom),
            //-- distribute
            constraint(v2, .Leading, .Equal, v1, .Trailing),
            constraint(v3, .Leading, .Equal, v2, .Trailing),
        ]))
        
        // H_Fill_Fill_10.0_false
        stack.spacing = 10
        stack.layoutIfNeeded()
        XCTAssert(checkConstraints(stack.constraints, [
            //-- Pin first and last
            constraint(v1, .Leading, .Equal, stack, .Leading),
            constraint(v3, .Trailing, .Equal, stack, .Trailing),
            //-- align
            constraint(v1, .Top, .Equal, stack, .Top),
            constraint(v2, .Top, .Equal, stack, .Top),
            constraint(v3, .Top, .Equal, stack, .Top),
            constraint(v1, .Bottom, .Equal, stack, .Bottom),
            constraint(v2, .Bottom, .Equal, stack, .Bottom),
            constraint(v3, .Bottom, .Equal, stack, .Bottom),
            //-- distribute
            constraint(v2, .Leading, .Equal, v1, .Trailing, 10),
            constraint(v3, .Leading, .Equal, v2, .Trailing, 10),
        ]))
        
        // H_FillEqually_Fill_10.0_false
        stack.stackDistribution = .FillEqually
        stack.layoutIfNeeded()
        XCTAssert(checkConstraints(stack.constraints, [
            //-- Pin first and last
            constraint(v1, .Leading, .Equal, stack, .Leading),
            constraint(v3, .Trailing, .Equal, stack, .Trailing),
            //-- align
            constraint(v1, .Top, .Equal, stack, .Top),
            constraint(v2, .Top, .Equal, stack, .Top),
            constraint(v3, .Top, .Equal, stack, .Top),
            constraint(v1, .Bottom, .Equal, stack, .Bottom),
            constraint(v2, .Bottom, .Equal, stack, .Bottom),
            constraint(v3, .Bottom, .Equal, stack, .Bottom),
            //-- distribute
            constraint(v2, .Leading, .Equal, v1, .Trailing, 10),
            constraint(v3, .Leading, .Equal, v2, .Trailing, 10),
            constraint(v2, .Width, .Equal, v1, .Width),
            constraint(v3, .Width, .Equal, v2, .Width),
        ]))
        
        // H_FillProportionally_Fill_10.0_false
        stack.stackDistribution = .FillProportionally
        stack.layoutIfNeeded()
        XCTAssert(checkConstraints(stack.constraints, [
            //-- Pin first and last
            constraint(v1, .Leading, .Equal, stack, .Leading),
            constraint(v3, .Trailing, .Equal, stack, .Trailing),
            //-- align
            constraint(v1, .Top, .Equal, stack, .Top),
            constraint(v2, .Top, .Equal, stack, .Top),
            constraint(v3, .Top, .Equal, stack, .Top),
            constraint(v1, .Bottom, .Equal, stack, .Bottom),
            constraint(v2, .Bottom, .Equal, stack, .Bottom),
            constraint(v3, .Bottom, .Equal, stack, .Bottom),
            //-- distribute
            constraint(v2, .Leading, .Equal, v1, .Trailing, 10),
            constraint(v3, .Leading, .Equal, v2, .Trailing, 10),
            constraint(v1, .Width, .Equal, stack, .Width, 0, 0.2, 999),
            constraint(v2, .Width, .Equal, stack, .Width, 0, 0.2, 998),
            constraint(v3, .Width, .Equal, stack, .Width, 0, 0.2, 997),
        ]))
        
        // H_EqualSpacing_Fill_10.0_false
        stack.stackDistribution = .EqualSpacing
        stack.layoutIfNeeded()
        XCTAssertEqual(stack.subviews.count, 5)
        var g1 = stack.subviews[3]
        var g2 = stack.subviews[4]
        XCTAssert(checkConstraints(stack.constraints, [
            //-- Pin first and last
            constraint(v1, .Leading, .Equal, stack, .Leading),
            constraint(v3, .Trailing, .Equal, stack, .Trailing),
            //-- align
            constraint(v1, .Top, .Equal, stack, .Top),
            constraint(v2, .Top, .Equal, stack, .Top),
            constraint(v3, .Top, .Equal, stack, .Top),
            constraint(v1, .Bottom, .Equal, stack, .Bottom),
            constraint(v2, .Bottom, .Equal, stack, .Bottom),
            constraint(v3, .Bottom, .Equal, stack, .Bottom),
            //-- distribute
            constraint(g1, .Leading, .Equal, v1, .Trailing),
            constraint(g1, .Trailing, .Equal, v2, .Leading),
            constraint(g2, .Leading, .Equal, v2, .Trailing),
            constraint(g2, .Trailing, .Equal, v3, .Leading),
            constraint(g2, .Width, .Equal, g1, .Width),
            //-- force space
            constraint(v2, .Leading, .GreaterThanOrEqual, v1, .Trailing, 10),
            constraint(v3, .Leading, .GreaterThanOrEqual, v2, .Trailing, 10),
        ]))
        
        // H_EqualCentering_Fill_10.0_false
        stack.stackDistribution = .EqualCentering
        stack.layoutIfNeeded()
        XCTAssertEqual(stack.subviews.count, 5)
        g1 = stack.subviews[3]
        g2 = stack.subviews[4]
        XCTAssert(checkConstraints(stack.constraints, [
            //-- Pin first and last
            constraint(v1, .Leading, .Equal, stack, .Leading),
            constraint(v3, .Trailing, .Equal, stack, .Trailing),
            //-- align
            constraint(v1, .Top, .Equal, stack, .Top),
            constraint(v2, .Top, .Equal, stack, .Top),
            constraint(v3, .Top, .Equal, stack, .Top),
            constraint(v1, .Bottom, .Equal, stack, .Bottom),
            constraint(v2, .Bottom, .Equal, stack, .Bottom),
            constraint(v3, .Bottom, .Equal, stack, .Bottom),
            //-- distribute
            constraint(g1, .Leading, .Equal, v1, .CenterX),
            constraint(g1, .Trailing, .Equal, v2, .CenterX),
            constraint(g2, .Leading, .Equal, v2, .CenterX),
            constraint(g2, .Trailing, .Equal, v3, .CenterX),
            constraint(g2, .Width, .Equal, g1, .Width, 0, 1, 149),
            //-- force space
            constraint(v2, .Leading, .GreaterThanOrEqual, v1, .Trailing, 10),
            constraint(v3, .Leading, .GreaterThanOrEqual, v2, .Trailing, 10),
        ]))
        
        // H_Fill_Leading_0.0_false
        stack.spacing = 0
        stack.stackDistribution = .Fill
        stack.stackAlignment = .Leading
        stack.layoutIfNeeded()
        XCTAssert(checkConstraints(stack.constraints, [
            //-- Pin first and last
            constraint(v1, .Leading, .Equal, stack, .Leading),
            constraint(v3, .Trailing, .Equal, stack, .Trailing),
            //-- distribute
            constraint(v2, .Leading, .Equal, v1, .Trailing),
            constraint(v3, .Leading, .Equal, v2, .Trailing),
            //-- align
            constraint(v1, .Top, .Equal, stack, .Top),
            constraint(v2, .Top, .Equal, stack, .Top),
            constraint(v3, .Top, .Equal, stack, .Top),
            constraint(v1, .Bottom, .LessThanOrEqual, stack, .Bottom),
            constraint(v2, .Bottom, .LessThanOrEqual, stack, .Bottom),
            constraint(v3, .Bottom, .LessThanOrEqual, stack, .Bottom),
        ]))
        
        // H_Fill_Trailing_0.0_false
        stack.stackAlignment = .Trailing
        stack.layoutIfNeeded()
        XCTAssert(checkConstraints(stack.constraints, [
            //-- Pin first and last
            constraint(v1, .Leading, .Equal, stack, .Leading),
            constraint(v3, .Trailing, .Equal, stack, .Trailing),
            //-- distribute
            constraint(v2, .Leading, .Equal, v1, .Trailing),
            constraint(v3, .Leading, .Equal, v2, .Trailing),
            //-- align
            constraint(v1, .Bottom, .Equal, stack, .Bottom),
            constraint(v2, .Bottom, .Equal, stack, .Bottom),
            constraint(v3, .Bottom, .Equal, stack, .Bottom),
            constraint(v1, .Top, .GreaterThanOrEqual, stack, .Top),
            constraint(v2, .Top, .GreaterThanOrEqual, stack, .Top),
            constraint(v3, .Top, .GreaterThanOrEqual, stack, .Top),
            ]))
        
        // H_Fill_Center_0.0_false
        stack.stackAlignment = .Center
        stack.layoutIfNeeded()
        XCTAssert(checkConstraints(stack.constraints, [
            //-- Pin first and last
            constraint(v1, .Leading, .Equal, stack, .Leading),
            constraint(v3, .Trailing, .Equal, stack, .Trailing),
            //-- distribute
            constraint(v2, .Leading, .Equal, v1, .Trailing),
            constraint(v3, .Leading, .Equal, v2, .Trailing),
            //-- align
            constraint(v1, .CenterY, .Equal, stack, .CenterY),
            constraint(v2, .CenterY, .Equal, stack, .CenterY),
            constraint(v3, .CenterY, .Equal, stack, .CenterY),
            constraint(v1, .Top, .GreaterThanOrEqual, stack, .Top),
            constraint(v2, .Top, .GreaterThanOrEqual, stack, .Top),
            constraint(v3, .Top, .GreaterThanOrEqual, stack, .Top),
            constraint(v1, .Bottom, .LessThanOrEqual, stack, .Bottom),
            constraint(v2, .Bottom, .LessThanOrEqual, stack, .Bottom),
            constraint(v3, .Bottom, .LessThanOrEqual, stack, .Bottom),
        ]))
        
        // H_Fill_FirstBaseline_0.0_false
        stack.stackAlignment = .FirstBaseline
        stack.layoutIfNeeded()
        XCTAssert(checkConstraints(stack.constraints, [
            //-- Pin first and last
            constraint(v1, .Leading, .Equal, stack, .Leading),
            constraint(v3, .Trailing, .Equal, stack, .Trailing),
            //-- distribute
            constraint(v2, .Leading, .Equal, v1, .Trailing),
            constraint(v3, .Leading, .Equal, v2, .Trailing),
            //-- align
            constraint(v2, .FirstBaseline, .Equal, v1, .FirstBaseline),
            constraint(v3, .FirstBaseline, .Equal, v1, .FirstBaseline),
            constraint(v1, .Top, .GreaterThanOrEqual, stack, .Top),
            constraint(v2, .Top, .GreaterThanOrEqual, stack, .Top),
            constraint(v3, .Top, .GreaterThanOrEqual, stack, .Top),
            constraint(v1, .Bottom, .LessThanOrEqual, stack, .Bottom),
            constraint(v2, .Bottom, .LessThanOrEqual, stack, .Bottom),
            constraint(v3, .Bottom, .LessThanOrEqual, stack, .Bottom),
        ]))
        
        // H_Fill_LastBaseline_0.0_false
        stack.stackAlignment = .LastBaseline
        stack.layoutIfNeeded()
        XCTAssert(checkConstraints(stack.constraints, [
            //-- Pin first and last
            constraint(v1, .Leading, .Equal, stack, .Leading),
            constraint(v3, .Trailing, .Equal, stack, .Trailing),
            //-- distribute
            constraint(v2, .Leading, .Equal, v1, .Trailing),
            constraint(v3, .Leading, .Equal, v2, .Trailing),
            //-- align
            constraint(v2, .Baseline, .Equal, v1, .Baseline),
            constraint(v3, .Baseline, .Equal, v1, .Baseline),
            constraint(v1, .Top, .GreaterThanOrEqual, stack, .Top),
            constraint(v2, .Top, .GreaterThanOrEqual, stack, .Top),
            constraint(v3, .Top, .GreaterThanOrEqual, stack, .Top),
            constraint(v1, .Bottom, .LessThanOrEqual, stack, .Bottom),
            constraint(v2, .Bottom, .LessThanOrEqual, stack, .Bottom),
            constraint(v3, .Bottom, .LessThanOrEqual, stack, .Bottom),
        ]))
    }
}

func ==(c1: NSLayoutConstraint, c2: NSLayoutConstraint) -> Bool {
    return (c1.firstItem as! View).isEqualTo(c2.firstItem as! View)
        && c1.firstAttribute == c2.firstAttribute
        && (c1.secondItem as! View).isEqualTo(c2.secondItem as! View)
        && c1.secondAttribute == c2.secondAttribute
        && c1.relation == c2.relation
        && c1.constant == c2.constant
        && c1.priority == c2.priority
}