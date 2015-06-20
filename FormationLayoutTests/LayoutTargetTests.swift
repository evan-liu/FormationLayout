//
//  LayoutTargetTests.swift
//  FormationLayout
//
//  Created by Evan on 18/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
import FormationLayout

class LayoutTargetTests: XCTestCase {
    let view = UIView()
    
    // view layout target factory methods
    func testFactoryMethods() {
        // should set view and attibute
        
        XCTAssertEqual(view.left.view, view)
        XCTAssertEqual(view.left.attribute, NSLayoutAttribute.Left)
        
        XCTAssertEqual(view.right.view, view)
        XCTAssertEqual(view.right.attribute, NSLayoutAttribute.Right)
        
        XCTAssertEqual(view.top.view, view)
        XCTAssertEqual(view.top.attribute, NSLayoutAttribute.Top)
        
        XCTAssertEqual(view.bottom.view, view)
        XCTAssertEqual(view.bottom.attribute, NSLayoutAttribute.Bottom)
        
        XCTAssertEqual(view.leading.view, view)
        XCTAssertEqual(view.leading.attribute, NSLayoutAttribute.Leading)
        
        XCTAssertEqual(view.trailing.view, view)
        XCTAssertEqual(view.trailing.attribute, NSLayoutAttribute.Trailing)
        
        XCTAssertEqual(view.width.view, view)
        XCTAssertEqual(view.width.attribute, NSLayoutAttribute.Width)
        
        XCTAssertEqual(view.height.view, view)
        XCTAssertEqual(view.height.attribute, NSLayoutAttribute.Height)
        
        XCTAssertEqual(view.centerX.view, view)
        XCTAssertEqual(view.centerX.attribute, NSLayoutAttribute.CenterX)
        
        XCTAssertEqual(view.centerY.view, view)
        XCTAssertEqual(view.centerY.attribute, NSLayoutAttribute.CenterY)
        
        XCTAssertEqual(view.baseline.view, view)
        XCTAssertEqual(view.baseline.attribute, NSLayoutAttribute.Baseline)
        
        XCTAssertEqual(view.firstBaseline.view, view)
        XCTAssertEqual(view.firstBaseline.attribute, NSLayoutAttribute.FirstBaseline)
        
        XCTAssertEqual(view.layoutTarget(.LeftMargin).view
            , view)
        XCTAssertEqual(view.layoutTarget(.LeftMargin).attribute
            , NSLayoutAttribute.LeftMargin)
        
    }
    
    // == operator
    func testEqual() {
        var target1 = LayoutTarget(view: view, attribute: .Left)
        var target2 = LayoutTarget(view: view, attribute: .Left)
        
        // should compare view
        XCTAssert(target1 == target2)
        XCTAssert(target1 != LayoutTarget(view: UIView(), attribute: .Left))
        
        // shold compare attribute
        XCTAssert(target1 != LayoutTarget(view: view, attribute: .Right))
        
        // should compare multiplier
        target1.multiplier = 2
        XCTAssert(target1 != target2)
        
        target2.multiplier = 2
        XCTAssert(target1 == target2)
        
        // should compare constant
        target1.constant = 10
        XCTAssert(target1 != target2)
        
        target2.constant = 10
        XCTAssert(target1 == target2)
    }
    
    // + - * / calculation operators
    func testCalculation() {
        // should take Int/CGFloat and change constant/multiplier
        
        XCTAssertEqual((view.left + 2 + 3.4).constant, 5.4)

        XCTAssertEqual((view.left + 10 - 2 - 2.6).constant, 5.4)
        
        XCTAssertEqual((view.left * 2 * 1.5).multiplier, 3.0)
        
        XCTAssertEqual((view.left / 2 / 2.5).multiplier, 0.2)
    }
    
    // + - * / UIView operators
    func testUIViewOperators() {
        func check(target: LayoutTarget, _ constant: CGFloat, _ multiplier: CGFloat = 1) {
            XCTAssertEqual(target.attribute, .NotAnAttribute)
            XCTAssertEqual(target.multiplier, multiplier)
            XCTAssertEqual(target.constant, constant)
        }
        
        check(view + 10, 10)
        check(view - 5.5, -5.5)
        check(view * 10, 0, 10)
        check(view / 2, 0, 0.5)
    }
}
