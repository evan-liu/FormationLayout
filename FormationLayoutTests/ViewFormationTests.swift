//
//  ViewFormationTests.swift
//  FormationLayout
//
//  Created by Evan on 18/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class ViewFormationTests: XCTestCase {
    var view: UIView!
    var formation: ViewFormation!

    override func setUp() {
        super.setUp()

        view = UIView()
        formation = ViewFormation(view: view)
    }
    
    // init()
    func testInit() {
        // should set translatesAutoresizingMaskIntoConstraints to false
        XCTAssertEqual(view.translatesAutoresizingMaskIntoConstraints, false)
    }
    
    // constraint factory methods
    func testConstraintFactoryMethods() {
        let uiView2 = UIView()
        
        // should create constraint and add to constraints
        formation.attribute(.Left, relatedBy: .Equal, target: uiView2.left)
        XCTAssertEqual(formation.constraints.count, 1)
        
        // should set up constraint and call handler
        formation.attribute(.Left, relatedBy: .Equal, target: uiView2.centerX, priority: 10) { constraint in
            XCTAssertEqual(constraint.firstItem as! UIView, self.view)
            XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Left)
            
            XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
            
            XCTAssertEqual(constraint.secondItem as! UIView, uiView2)
            XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.CenterX)
            
            XCTAssertEqual(constraint.priority, 10)
        }
    }
    
    // attribute helper extentions
    func testAttributeHelperExtensions() {
        let view2 = UIView()
        
        // should set up constraint and call handler
        formation
            .left(view2.centerX, priority: 10) { constraint in
                XCTAssertEqual(constraint.firstItem as! UIView, self.view)
                XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Left)
                
                XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
                
                XCTAssertEqual(constraint.secondItem as! UIView, view2)
                XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.CenterX)
                
                XCTAssertEqual(constraint.priority, 10)
            }
            .leftEqual(view2.left) { XCTAssertEqual($0.relation, NSLayoutRelation.Equal)}
            .leftLessThanOrEqual(view2.left) { XCTAssertEqual($0.relation, NSLayoutRelation.LessThanOrEqual)}
            .leftGreaterThanOrEqual(view2.left) { XCTAssertEqual($0.relation, NSLayoutRelation.GreaterThanOrEqual)}
        
        // should add to constraints
        XCTAssertEqual(formation.constraints.count, 4)
        
        // should support other attribute
        var checked = 0
        func checkAttribute(constraint: NSLayoutConstraint, _ attribute: NSLayoutAttribute, _ relation: NSLayoutRelation, _ constant: CGFloat = 0) {
            XCTAssertEqual(constraint.firstAttribute, attribute)
            XCTAssertEqual(constraint.relation, relation)
            XCTAssertEqual(constraint.constant, constant)
            checked++
        }
        
        formation
            .right(view2.right) { checkAttribute($0, .Right, .Equal) }
            .rightEqual(view2.right) { checkAttribute($0, .Right, .Equal) }
            .rightLessThanOrEqual(view2.right) { checkAttribute($0, .Right, .LessThanOrEqual) }
            .rightGreaterThanOrEqual(view2.right) { checkAttribute($0, .Right, .GreaterThanOrEqual) }
            
            .top(view2.top) { checkAttribute($0, .Top, .Equal) }
            .topEqual(view2.top) { checkAttribute($0, .Top, .Equal) }
            .topLessThanOrEqual(view2.top) { checkAttribute($0, .Top, .LessThanOrEqual) }
            .topGreaterThanOrEqual(view2.top) { checkAttribute($0, .Top, .GreaterThanOrEqual) }
            
            .bottom(view2.bottom) { checkAttribute($0, .Bottom, .Equal) }
            .bottomEqual(view2.bottom) { checkAttribute($0, .Bottom, .Equal) }
            .bottomLessThanOrEqual(view2.bottom) { checkAttribute($0, .Bottom, .LessThanOrEqual) }
            .bottomGreaterThanOrEqual(view2.bottom) { checkAttribute($0, .Bottom, .GreaterThanOrEqual) }
            
            .leading(view2.leading) { checkAttribute($0, .Leading, .Equal) }
            .leadingEqual(view2.leading) { checkAttribute($0, .Leading, .Equal) }
            .leadingLessThanOrEqual(view2.leading) { checkAttribute($0, .Leading, .LessThanOrEqual) }
            .leadingGreaterThanOrEqual(view2.leading) { checkAttribute($0, .Leading, .GreaterThanOrEqual) }
            
            .trailing(view2.trailing) { checkAttribute($0, .Trailing, .Equal) }
            .trailingEqual(view2.trailing) { checkAttribute($0, .Trailing, .Equal) }
            .trailingLessThanOrEqual(view2.trailing) { checkAttribute($0, .Trailing, .LessThanOrEqual) }
            .trailingGreaterThanOrEqual(view2.trailing) { checkAttribute($0, .Trailing, .GreaterThanOrEqual) }
            
            .centerX(view2.centerX) { checkAttribute($0, .CenterX, .Equal) }
            .centerXEqual(view2.centerX) { checkAttribute($0, .CenterX, .Equal) }
            .centerXLessThanOrEqual(view2.centerX) { checkAttribute($0, .CenterX, .LessThanOrEqual) }
            .centerXGreaterThanOrEqual(view2.centerX) { checkAttribute($0, .CenterX, .GreaterThanOrEqual) }
        
            .centerY(view2.centerY) { checkAttribute($0, .CenterY, .Equal) }
            .centerYEqual(view2.centerY) { checkAttribute($0, .CenterY, .Equal) }
            .centerYLessThanOrEqual(view2.centerY) { checkAttribute($0, .CenterY, .LessThanOrEqual) }
            .centerYGreaterThanOrEqual(view2.centerY) { checkAttribute($0, .CenterY, .GreaterThanOrEqual) }
        
            .baseline(view2.baseline) { checkAttribute($0, .Baseline, .Equal) }
            .baselineEqual(view2.baseline) { checkAttribute($0, .Baseline, .Equal) }
            .baselineLessThanOrEqual(view2.baseline) { checkAttribute($0, .Baseline, .LessThanOrEqual) }
            .baselineGreaterThanOrEqual(view2.baseline) { checkAttribute($0, .Baseline, .GreaterThanOrEqual) }
        
            .firstBaseline(view2.firstBaseline) { checkAttribute($0, .FirstBaseline, .Equal) }
            .firstBaselineEqual(view2.firstBaseline) { checkAttribute($0, .FirstBaseline, .Equal) }
            .firstBaselineLessThanOrEqual(view2.firstBaseline) { checkAttribute($0, .FirstBaseline, .LessThanOrEqual) }
            .firstBaselineGreaterThanOrEqual(view2.firstBaseline) { checkAttribute($0, .FirstBaseline, .GreaterThanOrEqual) }
        
            .width(view2.width) { checkAttribute($0, .Width, .Equal) }
            .widthEqual(view2.width) { checkAttribute($0, .Width, .Equal) }
            .widthLessThanOrEqual(view2.width) { checkAttribute($0, .Width, .LessThanOrEqual) }
            .widthGreaterThanOrEqual(view2.width) { checkAttribute($0, .Width, .GreaterThanOrEqual) }
        
            .height(view2.height) { checkAttribute($0, .Height, .Equal) }
            .heightEqual(view2.height) { checkAttribute($0, .Height, .Equal) }
            .heightLessThanOrEqual(view2.height) { checkAttribute($0, .Height, .LessThanOrEqual) }
            .heightGreaterThanOrEqual(view2.height) { checkAttribute($0, .Height, .GreaterThanOrEqual) }
        
            .width(10) { checkAttribute($0, .Width, .Equal, 10) }
            .widthEqual(10) { checkAttribute($0, .Width, .Equal, 10) }
            .widthLessThanOrEqual(5.5) { checkAttribute($0, .Width, .LessThanOrEqual, 5.5) }
            .widthGreaterThanOrEqual(5.5) { checkAttribute($0, .Width, .GreaterThanOrEqual, 5.5) }
            
            .height(10) { checkAttribute($0, .Height, .Equal, 10) }
            .heightEqual(10) { checkAttribute($0, .Height, .Equal, 10) }
            .heightLessThanOrEqual(5.5) { checkAttribute($0, .Height, .LessThanOrEqual, 5.5) }
            .heightGreaterThanOrEqual(5.5) { checkAttribute($0, .Height, .GreaterThanOrEqual, 5.5) }
        
        XCTAssertEqual(checked, 4 * 13)
        
        // Size
        checked = 0
        formation
            .size(10) { checkAttribute($0, $0.firstAttribute, .Equal, 10) }
            .sizeEqual(10) { checkAttribute($0, $0.firstAttribute, .Equal, 10) }
            .sizeLessThanOrEqual(5.5) { checkAttribute($0, $0.firstAttribute, .LessThanOrEqual, 5.5) }
            .sizeGreaterThanOrEqual(5.5) { checkAttribute($0, $0.firstAttribute, .GreaterThanOrEqual, 5.5) }
        XCTAssertEqual(checked, 2 * 4)
        
        checked = 0
        formation
            .size(view2.width) { checkAttribute($0, $0.firstAttribute, .Equal) }
            .sizeEqual(view2.width) { checkAttribute($0, $0.firstAttribute, .Equal) }
            .sizeLessThanOrEqual(view2.width) { checkAttribute($0, $0.firstAttribute, .LessThanOrEqual) }
            .sizeGreaterThanOrEqual(view2.width) { checkAttribute($0, $0.firstAttribute, .GreaterThanOrEqual) }
        XCTAssertEqual(checked, 2 * 4)

    }
    
    // +UIView
    func testUIViewExtensions() {
        var checked = 0
        func checkAttribute(constraint: NSLayoutConstraint, _ attribute: NSLayoutAttribute, _ secondView: UIView, _ relation: NSLayoutRelation = .Equal) {
            XCTAssertEqual(constraint.firstAttribute, attribute)
            XCTAssertEqual(constraint.secondAttribute, attribute)
            XCTAssertEqual(constraint.secondItem as! UIView, secondView)
            XCTAssertEqual(constraint.relation, relation)
            checked++
        }
        
        func test(checkCount: Int, @noescape block: (view2: UIView) -> Void) {
            checked = 0
            block(view2: UIView(frame: CGRectMake(100, 100, 100, 200)))
            XCTAssertEqual(checked, checkCount)
        }
        
        test(4) { view2 in
            formation.centerX(view2) { checkAttribute($0, .CenterX, view2) }
            formation.centerY(view2) { checkAttribute($0, .CenterY, view2) }
            formation.center(view2) { checkAttribute($0, $0.firstAttribute, view2) }
        }
    }
    
    // active property
    func testActive() {
        // should change active property of constraints
        
        formation.width(10).height(20)
        
        XCTAssertFalse(formation.constraints[0].active)
        XCTAssertFalse(formation.constraints[1].active)
        
        formation.active = true
        XCTAssertTrue(formation.constraints[0].active)
        XCTAssertTrue(formation.constraints[1].active)
        
        formation.active = false
        XCTAssertFalse(formation.constraints[0].active)
        XCTAssertFalse(formation.constraints[1].active)
    }
    
    // checkSizeClass()
    func testCheckSizeClass() {
        
        // should return true if no size classes installed
        XCTAssertTrue(formation.checkSizeClass(.Unspecified, .Unspecified))
        XCTAssertTrue(formation.checkSizeClass(.Unspecified, .Compact))
        XCTAssertTrue(formation.checkSizeClass(.Unspecified, .Regular))
        XCTAssertTrue(formation.checkSizeClass(.Compact, .Unspecified))
        XCTAssertTrue(formation.checkSizeClass(.Compact, .Compact))
        XCTAssertTrue(formation.checkSizeClass(.Compact, .Regular))
        XCTAssertTrue(formation.checkSizeClass(.Regular, .Unspecified))
        XCTAssertTrue(formation.checkSizeClass(.Regular, .Compact))
        XCTAssertTrue(formation.checkSizeClass(.Regular, .Regular))
        
        // should return true only for installed size classes
        formation.install(.WRegular)
        formation.install(.BothCompact)
        
        XCTAssertFalse(formation.checkSizeClass(.Unspecified, .Unspecified))
        XCTAssertFalse(formation.checkSizeClass(.Unspecified, .Compact))
        XCTAssertFalse(formation.checkSizeClass(.Unspecified, .Regular))
        XCTAssertFalse(formation.checkSizeClass(.Compact, .Unspecified))
        XCTAssertTrue(formation.checkSizeClass(.Compact, .Compact))
        XCTAssertFalse(formation.checkSizeClass(.Compact, .Regular))
        XCTAssertTrue(formation.checkSizeClass(.Regular, .Unspecified))
        XCTAssertTrue(formation.checkSizeClass(.Regular, .Compact))
        XCTAssertTrue(formation.checkSizeClass(.Regular, .Regular))
        
        // should return false for excepted size classes
        formation.except(.HRegular)
        formation.except(.WRegularHCompact)
        
        XCTAssertFalse(formation.checkSizeClass(.Unspecified, .Unspecified))
        XCTAssertFalse(formation.checkSizeClass(.Unspecified, .Compact))
        XCTAssertFalse(formation.checkSizeClass(.Unspecified, .Regular))
        XCTAssertFalse(formation.checkSizeClass(.Compact, .Unspecified))
        XCTAssertTrue(formation.checkSizeClass(.Compact, .Compact))
        XCTAssertFalse(formation.checkSizeClass(.Compact, .Regular))
        XCTAssertTrue(formation.checkSizeClass(.Regular, .Unspecified))
        XCTAssertFalse(formation.checkSizeClass(.Regular, .Compact))
        XCTAssertFalse(formation.checkSizeClass(.Regular, .Regular))
    }
    
}