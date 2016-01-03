//
//  ViewFormation+ContainerTests.swift
//  FormationLayout
//
//  Created by Evan on 3/01/16.
//  Copyright © 2016 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class ViewFormation_ContainerTests: XCTestCase {
    
    var superview: UIView!
    var subview: UIView!
    var formation: ViewFormation!
    
    override func setUp() {
        super.setUp()
        
        superview = UIView()
        subview = UIView()
        superview.addSubview(subview)
        
        formation = ViewFormation(view: subview)
    }

    func testNoContainer() {
        subview.removeFromSuperview()
        
        formation.pinTop()
        
        XCTAssertEqual(superview.constraints.count, 0)
        XCTAssertEqual(subview.constraints.count, 0)
    }
    
    func testPinTop() {
        formation.pinTop(padding: 10).active = true
        checkConstraint(superview.constraints.first!, .Top, .Top, 10)
    }
    func testPinBottom() {
        formation.pinBottom(padding: 10).active = true
        checkConstraint(superview.constraints.first!, .Bottom, .Bottom, -10)
    }
    
    func testPinLeft() {
        formation.pinLeft(padding: 10).active = true
        checkConstraint(superview.constraints.first!, .Left, .Left, 10)
    }
    func testPinRight() {
        formation.pinRight(padding: 10).active = true
        checkConstraint(superview.constraints.first!, .Right, .Right, -10)
    }
    
    func testPinLeading() {
        formation.pinLeading(padding: 10).active = true
        checkConstraint(superview.constraints.first!, .Leading, .Leading, 10)
    }
    func testPinTrailing() {
        formation.pinTrailing(padding: 10).active = true
        checkConstraint(superview.constraints.first!, .Trailing, .Trailing, -10)
    }
    
    func testPinCenterX() {
        formation.pinCenterX(offset: 10).active = true
        checkConstraint(superview.constraints.first!, .CenterX, .CenterX, 10)
    }
    func testPinCenterY() {
        formation.pinCenterY(offset: 10).active = true
        checkConstraint(superview.constraints.first!, .CenterY, .CenterY, 10)
    }
    func testPinCenter() {
        formation.pinCenter(offset: (10, 10)).active = true
        checkConstraint(superview.constraints.first!, .CenterX, .CenterX, 10)
        checkConstraint(superview.constraints.last!, .CenterY, .CenterY, 10)
    }
    
    func testFillWidth() {
        formation.fillWidth(padding: 10).active = true
        checkConstraint(superview.constraints.first!, .Leading, .Leading, 10)
        checkConstraint(superview.constraints.last!, .Trailing, .Trailing, -10)
    }
    func testFillHeight() {
        formation.fillHeight(padding: 10).active = true
        checkConstraint(superview.constraints.first!, .Top, .Top, 10)
        checkConstraint(superview.constraints.last!, .Bottom, .Bottom, -10)
    }
    func testFill() {
        formation.fill(padding: 10).active = true
        checkConstraint(superview.constraints[0], .Leading, .Leading, 10)
        checkConstraint(superview.constraints[1], .Trailing, .Trailing, -10)
        checkConstraint(superview.constraints[2], .Top, .Top, 10)
        checkConstraint(superview.constraints[3], .Bottom, .Bottom, -10)
    }

    private func checkConstraint(constraint: NSLayoutConstraint, _ firstAttribute: NSLayoutAttribute, _ secondAttribute: NSLayoutAttribute, _ constant: CGFloat = 0) {
        
        XCTAssertEqual(constraint.firstAttribute, firstAttribute)
        XCTAssertEqual(constraint.secondAttribute, secondAttribute)
        
        XCTAssertEqual(constraint.firstItem as? UIView, subview)
        XCTAssertEqual(constraint.secondItem as? UIView, superview)
        
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, constant)
    }
    
}
